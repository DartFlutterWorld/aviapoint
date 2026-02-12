import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_edit_bloc.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAircraftAdsWidget extends StatefulWidget {
  final int userId;

  const MyAircraftAdsWidget({super.key, required this.userId});

  @override
  State<MyAircraftAdsWidget> createState() => _MyAircraftAdsWidgetState();
}

class _MyAircraftAdsWidgetState extends State<MyAircraftAdsWidget> {
  @override
  Widget build(BuildContext context) {
    // Получаем глобальный BLoC из app.dart
    final globalBloc = context.read<AircraftMarketBloc>();

    return BlocProvider(
      create: (context) {
        final bloc = AircraftMarketBloc(repository: getIt<MarketRepository>());
        bloc.add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
        return bloc;
      },
      child: MultiBlocListener(
        listeners: [
          // Слушаем глобальный BLoC (для обновления при возврате с экрана редактирования)
          BlocListener<AircraftMarketBloc, AircraftMarketState>(
            bloc: globalBloc,
            listenWhen: (previous, current) {
              // Реагируем на refresh в глобальном BLoC (когда возвращаемся с экрана редактирования)
              if (previous is LoadingAircraftMarketState && current is SuccessAircraftMarketState) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              // После refresh в глобальном BLoC обновляем локальный BLoC в профиле
              state.maybeWhen(
                success: (products, hasMore) {
                  final localBloc = BlocProvider.of<AircraftMarketBloc>(context);
                  localBloc.add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Мои самолёты', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                    TextButton(
                      onPressed: () {
                        context.router.push(
                          BaseRoute(
                            children: [
                              MarketNavigationRoute(children: [CreateAircraftMarketRoute()]),
                            ],
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, size: 18, color: AppColors.primary100p),
                          SizedBox(width: 4),
                          Text('Создать', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                state.when(
                  loading: () => Center(
                    child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                  ),
                  loadingMore: (products) => _buildAdsGrid(context, products, isLoading: true),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: const Color(0xFFEF4444))),
                    ),
                  ),
                  success: (products, hasMore) => _buildAdsGrid(context, products, isLoading: false),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAdsGrid(BuildContext context, List<AircraftMarketEntity> products, {required bool isLoading}) {
    if (products.isEmpty && !isLoading) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.airplanemode_inactive, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12),
              Text('У вас пока нет объявлений', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  context.router.push(
                    BaseRoute(
                      children: [
                        MarketNavigationRoute(children: [CreateAircraftMarketRoute()]),
                      ],
                    ),
                  );
                },
                child: Text('Создать объявление', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
              ),
            ],
          ),
        ),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = Provider.of<AppState>(context, listen: false).isTablet;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Количество карточек в строке — как в маркете
    final crossAxisCount = kIsWeb
        ? () {
            if (screenWidth >= 1200) return 4;
            if (screenWidth >= 900) return 3;
            if (screenWidth >= 600) return 2;
            return 1;
          }()
        : (isLandscape ? 3 : (isTablet ? 2 : 2));

    const horizontalPadding = 8.0;
    const crossAxisSpacing = 12.0;
    final availableWidth =
        screenWidth - horizontalPadding * 2 - crossAxisSpacing * (crossAxisCount - 1);
    final rawCardWidth = availableWidth / crossAxisCount;
    const maxCardWidth = 480.0;
    final clampedWidth = math.min(rawCardWidth, maxCardWidth);
    // Те же пропорции карточки, что и в маркете (childAspectRatio = width/height)
    final cardAspectRatio = kIsWeb ? 1.0 : (isTablet ? 1.0 : 0.9);
    final cardHeight = clampedWidth / cardAspectRatio;

    return SizedBox(
      height: cardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: clampedWidth,
            margin: const EdgeInsets.only(right: crossAxisSpacing),
            child: AircraftMarketCard(
              product: product,
              showEditButtons: true,
              showYearAndLocation: false,
              showInactiveBadge: true,
              onTap: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      MarketNavigationRoute(children: [AircraftMarketDetailRoute(id: product.id)]),
                    ],
                  ),
                );
              },
              onEdit: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      MarketNavigationRoute(children: [EditAircraftMarketRoute(productId: product.id)]),
                    ],
                  ),
                );
              },
              onDelete: () => _showDeleteConfirmation(product),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmation(AircraftMarketEntity product) {
    // Создаем локальный BLoC для удаления
    final deleteBloc = AircraftMarketEditBloc(repository: getIt<MarketRepository>());

    showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: deleteBloc,
        child: BlocListener<AircraftMarketEditBloc, AircraftMarketEditState>(
          listener: (context, state) {
            state.maybeWhen(
              deleted: (productId) {
                Navigator.of(dialogContext).pop();
                deleteBloc.close();
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Объявление успешно удалено'), backgroundColor: Colors.green));
                // Обновляем список после удаления
                final localBloc = BlocProvider.of<AircraftMarketBloc>(context);
                localBloc.add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
              },
              error: (message) {
                Navigator.of(dialogContext).pop();
                deleteBloc.close();
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
              },
              orElse: () {},
            );
          },
          child: AlertDialog(
            title: Text('Удалить объявление?', style: AppStyles.bold16s),
            content: Text('Вы уверены, что хотите удалить это объявление? Это действие нельзя отменить.', style: AppStyles.regular14s),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  deleteBloc.close();
                },
                child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280))),
              ),
              BlocBuilder<AircraftMarketEditBloc, AircraftMarketEditState>(
                builder: (context, state) {
                  final isDeleting = state is DeletingAircraftMarketEditState;
                  return ElevatedButton(
                    onPressed: isDeleting
                        ? null
                        : () {
                            deleteBloc.add(AircraftMarketEditEvent.deleteProduct(product.id));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: isDeleting
                        ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : Text('Удалить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

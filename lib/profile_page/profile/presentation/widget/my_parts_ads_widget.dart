import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/presentation/widgets/parts_market_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPartsAdsWidget extends StatefulWidget {
  final int userId;

  const MyPartsAdsWidget({super.key, required this.userId});

  @override
  State<MyPartsAdsWidget> createState() => _MyPartsAdsWidgetState();
}

class _MyPartsAdsWidgetState extends State<MyPartsAdsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = PartsMarketBloc(repository: getIt<MarketRepository>());
        bloc.add(PartsMarketEvent.getParts(sellerId: widget.userId, includeInactive: true));
        return bloc;
      },
      child: BlocBuilder<PartsMarketBloc, PartsMarketState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Мои запчасти', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                  TextButton(
                    onPressed: () {
                      context.router.push(
                        BaseRoute(
                          children: [
                            MarketNavigationRoute(children: [CreatePartsMarketRoute()]),
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
                loadingMore: (parts) => _buildPartsList(context, parts, isLoading: true),
                error: (String? errorFromApi, String errorForUser, String? statusCode, StackTrace? stackTrace, String? responseMessage) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: const Color(0xFFEF4444))),
                  ),
                ),
                success: (parts, hasMore) => _buildPartsList(context, parts, isLoading: false),
                creatingPart: () => Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                ),
                createdPart: (part) {
                  // Список обновится через BlocListener
                  return Center(
                    child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                  );
                },
                updating: () => Center(
                  child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                ),
                updated: (part) {
                  // Список обновится через BlocListener
                  return Center(
                    child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPartsList(BuildContext context, List<PartsMarketEntity> parts, {required bool isLoading}) {
    if (parts.isEmpty && !isLoading) {
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
              Icon(Icons.inventory_2_outlined, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12),
              Text('У вас пока нет запчастей', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  context.router.push(
                    BaseRoute(
                      children: [
                        MarketNavigationRoute(children: [CreatePartsMarketRoute()]),
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

    return SizedBox(
      height: 280, // Фиксированная высота для горизонтального списка
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: parts.length,
        itemBuilder: (context, index) {
          final part = parts[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.45, // Ширина карточки
            margin: EdgeInsets.only(right: 12),
            child: PartsMarketCard(
              part: part,
              showEditButtons: true,
              showCategoryAndManufacturer: true,
              showInactiveBadge: true,
              onTap: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      MarketNavigationRoute(children: [PartsMarketDetailRoute(id: part.id)]),
                    ],
                  ),
                );
              },
              onEdit: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      MarketNavigationRoute(children: [EditPartsMarketRoute(productId: part.id)]),
                    ],
                  ),
                );
              },
              onDelete: () => _showDeleteConfirmation(part),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmation(PartsMarketEntity part) {
    final localBloc = BlocProvider.of<PartsMarketBloc>(context);

    showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: localBloc,
        child: AlertDialog(
          title: Text('Удалить объявление?', style: AppStyles.bold16s),
          content: Text('Вы уверены, что хотите удалить это объявление? Это действие нельзя отменить.', style: AppStyles.regular14s),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _deletePart(part);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Удалить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _deletePart(PartsMarketEntity part) {
    final localBloc = BlocProvider.of<PartsMarketBloc>(context);
    localBloc.add(PartsMarketEvent.deletePart(part.id));
  }
}

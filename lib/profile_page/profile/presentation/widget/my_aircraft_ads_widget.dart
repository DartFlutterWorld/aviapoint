import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // Слушаем локальный BLoC (для создания, обновления и удаления через локальный BLoC)
          BlocListener<AircraftMarketBloc, AircraftMarketState>(
            listenWhen: (previous, current) {
              // Реагируем на изменения состояния после удаления, создания или обновления
              // Отслеживаем переход от одного success к другому после delete
              if (previous is SuccessAircraftMarketState && current is SuccessAircraftMarketState) {
                // Это может быть удаление - проверяем, что количество товаров уменьшилось
                final previousProducts = previous.products;
                final currentProducts = current.products;
                if (currentProducts.length < previousProducts.length) {
                  // Товар был удален
                  return true;
                }
              }
              // Реагируем на создание, обновление и ошибки
              return current.maybeWhen(
                createdAirCraft: (_) => true,
                updated: (_) => true,
                error: (_) => true,
                orElse: () => false,
              );
            },
            listener: (context, state) {
              // Обновляем список после создания, обновления или удаления
              state.maybeWhen(
                createdAirCraft: (product) {
                  context.read<AircraftMarketBloc>().add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
                },
                updated: (product) {
                  context.read<AircraftMarketBloc>().add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
                },
                success: (products, hasMore) {
                  // После успешного удаления товар уже убран из списка через _currentProducts.removeWhere
                  // Показываем сообщение об успешном удалении (будет показано только если количество уменьшилось)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Объявление успешно удалено'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                error: (message) {
                  // Показываем ошибку удаления, если она произошла
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message), backgroundColor: Colors.red),
                  );
                },
                orElse: () {},
              );
            },
          ),
          // Слушаем глобальный BLoC (для обновления через глобальный BLoC из экрана редактирования и при возврате с детальной страницы)
          BlocListener<AircraftMarketBloc, AircraftMarketState>(
            bloc: globalBloc,
            listenWhen: (previous, current) {
              // Реагируем на:
              // 1. updated после updating в глобальном BLoC
              // 2. success после refresh в глобальном BLoC (когда возвращаемся с детальной страницы)
              if (previous is UpdatingMarketProductState) {
                return current is UpdatedMarketProductState;
              }
              // Если было loading и стало success - это refresh
              if (previous is LoadingAircraftMarketState && current is SuccessAircraftMarketState) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              // Обновляем локальный список после обновления в глобальном BLoC
              state.maybeWhen(
                updated: (product) {
                  // Обновляем локальный BLoC в профиле
                  final localBloc = BlocProvider.of<AircraftMarketBloc>(context);
                  localBloc.add(AircraftMarketEvent.getProducts(sellerId: widget.userId, includeInactive: true));
                },
                success: (products, hasMore) {
                  // После refresh в глобальном BLoC обновляем локальный BLoC в профиле
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
                  Text('Мои объявления', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                  TextButton(
                    onPressed: () {
                      context.router.push(
                        BaseRoute(
                          children: [
                            MarketNavigationRoute(
                              children: [CreateAircraftMarketRoute()],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 18, color: AppColors.primary100p),
                        SizedBox(width: 4.w),
                        Text('Создать', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              state.when(
                loading: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                loadingMore: (products) => _buildAdsGrid(context, products, isLoading: true),
                error: (message) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(message, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
                success: (products, hasMore) => _buildAdsGrid(context, products, isLoading: false),
                creatingAirCraft: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                createdAirCraft: (product) {
                  // Список обновится через BlocListener
                  return Center(
                    child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                  );
                },
                updating: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                updated: (product) {
                  // Список обновится через BlocListener
                  return Center(
                    child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                  );
                },
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
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.airplanemode_inactive, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12.h),
              Text('У вас пока нет объявлений', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {
                  context.router.push(
                    BaseRoute(
                      children: [
                        MarketNavigationRoute(
                          children: [CreateAircraftMarketRoute()],
                        ),
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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: kIsWeb ? 3 : 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: kIsWeb ? 0.95 : 0.67,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return AircraftMarketCard(
          product: product,
          showEditButtons: true,
          showYearAndLocation: true,
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
                  MarketNavigationRoute(children: [EditAircraftMarketRoute(product: product)]),
                ],
              ),
            );
          },
          onDelete: () => _showDeleteConfirmation(product),
        );
      },
    );
  }

  void _showDeleteConfirmation(AircraftMarketEntity product) {
    // Важно: используем локальный BLoC из BlocProvider
    final localBloc = BlocProvider.of<AircraftMarketBloc>(context);
    
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
                _deleteProduct(product);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteProduct(AircraftMarketEntity product) {
    // Используем локальный AircraftMarketBloc для удаления
    // Важно: используем BlocProvider.of, чтобы получить именно локальный BLoC из BlocProvider
    final localBloc = BlocProvider.of<AircraftMarketBloc>(context);
    
    // Отправляем событие удаления
    // После успешного удаления BLoC автоматически удалит товар из _currentProducts
    // и эмитнет success с обновленным списком
    // BlocListener отследит изменение и покажет сообщение об успехе
    localBloc.add(AircraftMarketEvent.deleteProduct(product.id));
  }
}


import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Универсальная карточка товара для использования в маркете и профиле
class AircraftMarketCard extends StatelessWidget {
  final AircraftMarketEntity product;
  final bool showEditButtons; // Показывать ли кнопки редактирования/удаления
  final bool showYearAndLocation; // Показывать ли год выпуска и местоположение
  final bool showInactiveBadge; // Показывать ли бейдж "Не активно"
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const AircraftMarketCard({super.key, required this.product, this.showEditButtons = false, this.showYearAndLocation = true, this.showInactiveBadge = false, this.onTap, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.mainImageUrl ?? (product.additionalImageUrls.isNotEmpty ? product.additionalImageUrls.first : null);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Изображение
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        // Градиент для плавного перехода
                      ),
                      child: imageUrl != null ? _ProductImage(imageUrl: getImageUrl(imageUrl)) : Center(child: Icon(Icons.image, color: Colors.grey.shade400, size: 32)),
                    ),
                  ),
                  // Бейдж "Не активно" (если нужно и объявление неактивно)
                  if (showInactiveBadge && !product.isActive)
                    Positioned.fill(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: Colors.black.withOpacity(0.25),
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(8.r)),
                            child: Text('Не активно', style: AppStyles.regular12s.copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  // Чипс с долей
                  if (product.isShareSale == true && product.shareNumerator != null && product.shareDenominator != null)
                    Positioned(
                      top: 8.h,
                      left: showEditButtons ? 8.w : null, // Если есть кнопки редактирования - слева
                      right: !showEditButtons ? 8.w : null, // Если нет кнопок - справа
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(12.r)),
                        child: Text('Доля ${product.shareNumerator}/${product.shareDenominator}', style: AppStyles.regular12s.copyWith(color: Colors.white)),
                      ),
                    ),
                  // Кнопки редактирования и удаления (если нужно)
                  if (showEditButtons)
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Кнопка редактирования
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.7), shape: BoxShape.circle),
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.white, size: 18),
                              onPressed:
                                  onEdit ??
                                  () {
                                    context.router.push(
                                      BaseRoute(
                                        children: [
                                          MarketNavigationRoute(children: [EditAircraftMarketRoute(product: product)]),
                                        ],
                                      ),
                                    );
                                  },
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          // Кнопка удаления
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(color: Colors.red.withOpacity(0.7), shape: BoxShape.circle),
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.white, size: 18),
                              onPressed: onDelete,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // Информация
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Верхняя часть - заголовок и мета-информация
                    Text(product.title, style: AppStyles.regular12s.copyWith(height: 1.4), maxLines: 3, overflow: TextOverflow.ellipsis),
                    // Год выпуска и местоположение (если нужно)
                    if (showYearAndLocation) ...[
                      if (product.year != null) ...[
                        SizedBox(height: 6.h),
                        Text('Год выпуска ${product.year}', style: AppStyles.regular12s.copyWith(fontSize: 10, color: Color(0xFF9CA5AF), height: 1.3)),
                      ],
                      if (product.location != null && product.location!.isNotEmpty) ...[
                        SizedBox(height: 3.h),
                        Text(
                          product.location!,
                          style: AppStyles.regular12s.copyWith(fontSize: 10, color: Color(0xFF9CA5AF), height: 1.3),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ],
                    ],
                    Spacer(),
                    // Нижняя часть - цена (прижата к низу)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${formatPrice(product.price)} ₽',
                          style: AppStyles.bold16s.copyWith(color: AppColors.primary100p),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Виджет для отображения изображения товара с обработкой вертикальных и горизонтальных фотографий
class _ProductImage extends StatelessWidget {
  final String imageUrl;

  const _ProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade100,
      child: Image.network(
        imageUrl,
        // Сохраняем пропорции изображения, не сжимаем и не растягиваем
        fit: BoxFit.cover,
        alignment: Alignment.center,
        // Плавная загрузка изображения
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: Colors.grey.shade50,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                strokeWidth: 2,
                color: Colors.grey.shade400,
              ),
            ),
          );
        },
        // Обработка ошибок загрузки
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade100,
            child: Center(child: Icon(Icons.image_not_supported, color: Colors.grey.shade400, size: 32)),
          );
        },
        // Плавное появление изображения
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return AnimatedOpacity(opacity: frame == null ? 0 : 1, duration: const Duration(milliseconds: 200), curve: Curves.easeOut, child: child);
          }
          return Container(
            color: Colors.grey.shade50,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey.shade400)),
          );
        },
        // Кеширование для лучшей производительности
        cacheWidth: 600, // Больший размер для лучшего качества
        cacheHeight: 600,
      ),
    );
  }
}

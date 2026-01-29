import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:flutter/material.dart';

/// Универсальная карточка товара для использования в маркете и профиле
class AircraftMarketCard extends StatefulWidget {
  final AircraftMarketEntity product;
  final bool showEditButtons; // Показывать ли кнопки редактирования/удаления
  final bool showYearAndLocation; // Показывать ли год выпуска и местоположение
  final bool showInactiveBadge; // Показывать ли бейдж "Не активно"
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const AircraftMarketCard({super.key, required this.product, this.showEditButtons = false, this.showYearAndLocation = true, this.showInactiveBadge = false, this.onTap, this.onEdit, this.onDelete});

  @override
  State<AircraftMarketCard> createState() => _AircraftMarketCardState();
}

class _AircraftMarketCardState extends State<AircraftMarketCard> {
  bool? _isImageHorizontal;

  void _onImageOrientationDetected(bool isHorizontal) {
    if (mounted && _isImageHorizontal != isHorizontal) {
      setState(() {
        _isImageHorizontal = isHorizontal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.product.mainImageUrl ?? (widget.product.additionalImageUrls.isNotEmpty ? widget.product.additionalImageUrls.first : null);
    final isHorizontal = _isImageHorizontal;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Фоновое изображение заполняет весь контейнер (или уменьшается для горизонтальных)
            if (imageUrl != null)
              _ProductImage(imageUrl: getImageUrl(imageUrl), onOrientationDetected: _onImageOrientationDetected, isHorizontal: isHorizontal == true)
            else
              Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: Icon(Icons.image, color: Colors.grey.shade400, size: 32.0),
              ),
            // Нижний блок с текстом и ценой (с подложкой под текстом)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.75),
                  color: isHorizontal == true ? Colors.black.withOpacity(1) : Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: AppStyles.bold12s.copyWith(color: Colors.white, height: 1.3),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.showYearAndLocation && (widget.product.year != null || (widget.product.location != null && widget.product.location!.isNotEmpty))) ...[
                      SizedBox(height: 4),
                      Row(
                        children: [
                          if (widget.product.year != null) Text('${widget.product.year}', style: AppStyles.medium8s.copyWith(color: Colors.white70)),
                          if (widget.product.year != null && widget.product.location != null && widget.product.location!.isNotEmpty) ...[
                            SizedBox(width: 8),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle),
                            ),
                            SizedBox(width: 4),
                          ],
                          if (widget.product.location != null && widget.product.location!.isNotEmpty)
                            Expanded(
                              child: Text(
                                widget.product.location!,
                                style: AppStyles.medium8s.copyWith(color: Colors.white70),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ],
                    SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${formatPrice(widget.product.price)} ₽',
                        style: AppStyles.bold16s.copyWith(
                          color: AppColors.primary100p, // Фиолетовый цвет для всех цен
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Бейдж "Не активно" (если нужно и объявление неактивно)
            if (widget.showInactiveBadge && !widget.product.isActive)
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(8)),
                      child: Text('Не активно', style: AppStyles.regular12s.copyWith(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            // Чипсы: доля и лизинг
            if ((widget.product.isShareSale == true && widget.product.shareNumerator != null && widget.product.shareDenominator != null) || widget.product.isLeasing == true)
              Positioned(
                top: 8,
                left: widget.showEditButtons ? 8 : null,
                right: !widget.showEditButtons ? 8 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.isShareSale == true && widget.product.shareNumerator != null && widget.product.shareDenominator != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: StatusChip(
                          text: 'Доля ${widget.product.shareNumerator}/${widget.product.shareDenominator}',
                          backgroundColor: Colors.black.withOpacity(0.7),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          borderRadius: 12,
                        ),
                      ),
                    if (widget.product.isLeasing == true)
                      StatusChip(text: 'Лизинг', backgroundColor: Colors.black.withOpacity(0.7), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), borderRadius: 12),
                  ],
                ),
              ),
            // Кнопки редактирования и удаления (если нужно)
            if (widget.showEditButtons)
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Кнопка редактирования
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.8), shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white, size: 18.0),
                        onPressed:
                            widget.onEdit ??
                            () {
                              context.router.push(
                                BaseRoute(
                                  children: [
                                    MarketNavigationRoute(children: [EditAircraftMarketRoute(product: widget.product)]),
                                  ],
                                ),
                              );
                            },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(width: 4),
                    // Кнопка удаления
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(color: Colors.red.withOpacity(0.8), shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white, size: 18.0),
                        onPressed: widget.onDelete,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Виджет для отображения изображения товара с обработкой вертикальных и горизонтальных фотографий
class _ProductImage extends StatefulWidget {
  final String imageUrl;
  final ValueChanged<bool>? onOrientationDetected;
  final bool isHorizontal;

  const _ProductImage({required this.imageUrl, this.onOrientationDetected, this.isHorizontal = false});

  @override
  State<_ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<_ProductImage> {
  Size? _imageSize;
  bool _isLoadingSize = true;
  ImageStreamListener? _imageStreamListener;
  ImageStream? _imageStream;

  @override
  void initState() {
    super.initState();
    _loadImageSize();
  }

  @override
  void dispose() {
    // Удаляем listener при размонтировании виджета
    if (_imageStream != null && _imageStreamListener != null) {
      _imageStream!.removeListener(_imageStreamListener!);
    }
    super.dispose();
  }

  Future<void> _loadImageSize() async {
    try {
      final imageProvider = NetworkImage(widget.imageUrl);
      _imageStream = imageProvider.resolve(ImageConfiguration.empty);
      _imageStreamListener = ImageStreamListener((ImageInfo info, bool synchronousCall) {
        if (mounted && _isLoadingSize) {
          final size = Size(info.image.width.toDouble(), info.image.height.toDouble());
          final isHorizontal = size.width > size.height;

          // Откладываем setState и callback до следующего кадра, чтобы избежать ошибки "setState during build"
          if (synchronousCall) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _isLoadingSize) {
                setState(() {
                  _imageSize = size;
                  _isLoadingSize = false;
                });
                if (mounted) {
                  widget.onOrientationDetected?.call(isHorizontal);
                }
              }
            });
          } else {
            setState(() {
              _imageSize = size;
              _isLoadingSize = false;
            });
            if (mounted) {
              widget.onOrientationDetected?.call(isHorizontal);
            }
          }
        }
      });
      _imageStream!.addListener(_imageStreamListener!);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingSize = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: widget.isHorizontal ? Colors.black : Colors.transparent,
      alignment: widget.isHorizontal ? Alignment.topCenter : Alignment.center,
      child: Image.network(
        widget.imageUrl,
        fit: widget.isHorizontal ? BoxFit.contain : BoxFit.cover,
        alignment: widget.isHorizontal ? Alignment.topCenter : Alignment.center,
        width: widget.isHorizontal ? double.infinity : double.infinity,
        height: widget.isHorizontal ? null : double.infinity,
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
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade100,
            child: Center(
              child: Icon(Icons.image_not_supported, color: Colors.grey.shade400, size: 32.0),
            ),
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return AnimatedOpacity(opacity: frame == null ? 0 : 1, duration: const Duration(milliseconds: 200), curve: Curves.easeOut, child: child);
          }
          return Container(
            color: Colors.grey.shade50,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey.shade400)),
          );
        },
        cacheWidth: 600,
        cacheHeight: 600,
      ),
    );
  }
}

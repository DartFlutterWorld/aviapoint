import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/address_display_helper.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:flutter/material.dart';

/// Универсальная карточка запчасти для использования в маркете и профиле
class PartsMarketCard extends StatefulWidget {
  final PartsMarketEntity part;
  final bool showEditButtons; // Показывать ли кнопки редактирования/удаления
  final bool showCategoryAndManufacturer; // Показывать ли категорию и производителя
  final bool showLocation; // Показывать ли адрес/местоположение
  final bool showInactiveBadge; // Показывать ли бейдж "Не активно"
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const PartsMarketCard({
    super.key,
    required this.part,
    this.showEditButtons = false,
    this.showCategoryAndManufacturer = true,
    this.showLocation = true,
    this.showInactiveBadge = false,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<PartsMarketCard> createState() => _PartsMarketCardState();
}

class _PartsMarketCardState extends State<PartsMarketCard> {
  bool? _isImageHorizontal;

  void _onImageOrientationDetected(bool isHorizontal) {
    if (mounted && _isImageHorizontal != isHorizontal) {
      setState(() {
        _isImageHorizontal = isHorizontal;
      });
    }
  }

  String _getConditionText(String? condition) {
    switch (condition) {
      case 'new':
        return 'Новое';
      case 'used':
        return 'Б/у';
      case 'restored':
        return 'Восстановленное';
      default:
        return condition ?? '';
    }
  }

  /// Короткий адрес для карточки: город или «город, регион» без дублей; иначе location без дубликатов.
  String? _shortLocationDisplay(PartsMarketEntity part) {
    if (part.address != null) {
      final short = AddressDisplayHelper.shortDisplay(part.address!.city, part.address!.region);
      if (short != null && short.isNotEmpty) return short;
    }
    return AddressDisplayHelper.locationStringWithoutDuplicates(part.location);
  }

  Widget _buildLocationRow(PartsMarketEntity part) {
    final text = _shortLocationDisplay(part);
    if (text == null || text.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, size: 12, color: Colors.white70),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: AppStyles.medium8s.copyWith(color: Colors.white70),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        widget.part.mainImageUrl ??
        (widget.part.additionalImageUrls.isNotEmpty ? widget.part.additionalImageUrls.first : null);
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
              _ProductImage(
                imageUrl: getImageUrl(imageUrl),
                onOrientationDetected: _onImageOrientationDetected,
                isHorizontal: isHorizontal == true,
              )
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
                  color: isHorizontal == true ? Colors.black.withOpacity(1) : Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.part.title,
                      style: AppStyles.bold12s.copyWith(color: Colors.white, height: 1.3),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (widget.showLocation)
                          Expanded(
                            child: _buildLocationRow(widget.part),
                          )
                        else
                          const SizedBox.shrink(),
                        Text(
                          '${formatPrice(widget.part.price)} ${getCurrencySymbol(widget.part.currency)}',
                          style: AppStyles.bold16s.copyWith(
                            color: AppColors.primary100p,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Бейдж "Не активно" (если нужно и объявление неактивно)
            if (widget.showInactiveBadge && !widget.part.isActive)
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Заблокировано администратором',
                        style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            // Чип состояния справа сверху
            if (widget.part.condition != null)
              Positioned(
                top: 8,
                right: widget.showEditButtons ? 48 : 8,
                child: StatusChip(
                  text: _getConditionText(widget.part.condition),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  borderRadius: 12,
                ),
              ),
            // Бейдж "Не опубликовано" по центру (только там, где нужен бейдж — например, в профиле)
            if (widget.showInactiveBadge && !widget.part.isPublished && widget.part.isActive)
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Не опубликовано',
                        style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
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
                        onPressed: widget.onEdit,
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

          if (synchronousCall) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _isLoadingSize) {
                setState(() {
                  _isLoadingSize = false;
                });
                if (mounted) {
                  widget.onOrientationDetected?.call(isHorizontal);
                }
              }
            });
          } else {
            setState(() {
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
      alignment: Alignment.center,
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: Colors.grey.shade50,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
                color: Colors.grey.shade400,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade100,
            child: Center(child: Icon(Icons.image_not_supported, color: Colors.grey.shade400, size: 32.0)),
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: child,
            );
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

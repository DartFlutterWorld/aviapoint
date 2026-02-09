import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// Универсальный виджет для загрузки сетевых изображений
///
/// На вебе использует Image.network (браузер сам кэширует через HTTP кэш)
/// На мобильных использует CachedNetworkImage (важно для офлайн и экономии трафика)
///
/// Особенно полезно для iOS Safari на вебе, где CachedNetworkImage может иметь проблемы
/// Для iOS Safari на вебе добавляет timestamp для обхода проблем с кэшированием
class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Map<String, String>? httpHeaders;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.httpHeaders,
  });

  @override
  Widget build(BuildContext context) {
    // На вебе используем Image.network (браузер сам кэширует)
    if (kIsWeb) {
      // Для iOS Safari на вебе добавляем timestamp для обхода проблем с кэшированием
      String finalImageUrl = imageUrl;
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        final uri = Uri.tryParse(imageUrl);
        if (uri != null) {
          final newUri = uri.replace(
            queryParameters: {...uri.queryParameters, '_t': DateTime.now().millisecondsSinceEpoch.toString()},
          );
          finalImageUrl = newUri.toString();
        } else {
          // Если не удалось распарсить URL, просто добавляем timestamp
          final separator = imageUrl.contains('?') ? '&' : '?';
          finalImageUrl = '$imageUrl${separator}_t=${DateTime.now().millisecondsSinceEpoch}';
        }

        if (kDebugMode) {
          debugPrint('📸 [NetworkImageWidget] iOS Safari: $imageUrl -> $finalImageUrl');
        }
      }

      return Image.network(
        finalImageUrl,
        fit: fit,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        headers: httpHeaders,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ?? _defaultPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) {
          if (kDebugMode) {
            debugPrint('❌ [NetworkImageWidget] Ошибка загрузки изображения: $finalImageUrl');
            debugPrint('   - Ошибка: $error');
            debugPrint('   - Оригинальный URL: $imageUrl');
          }
          return errorWidget ?? _defaultErrorWidget();
        },
      );
    }

    // На мобильных используем CachedNetworkImage (важно для кэширования)
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      httpHeaders: httpHeaders,
      cacheManager: GetIt.instance<DefaultCacheManager>(),
      cacheKey: imageUrl,
      placeholder: (context, url) => placeholder ?? _defaultPlaceholder(),
      errorWidget: (context, url, error) {
        if (kDebugMode) {
          debugPrint('❌ [NetworkImageWidget] Ошибка загрузки изображения: $url');
          debugPrint('   - Ошибка: $error');
        }
        return errorWidget ?? _defaultErrorWidget();
      },
    );
  }

  Widget _defaultPlaceholder() {
    return Shimmer(
      duration: const Duration(milliseconds: 1000),
      color: const Color(0xFF8D66FE),
      colorOpacity: 0.2,
      child: Container(width: width, height: height, decoration: const BoxDecoration()),
    );
  }

  Widget _defaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Icon(Icons.broken_image, color: Colors.grey, size: 48),
    );
  }
}

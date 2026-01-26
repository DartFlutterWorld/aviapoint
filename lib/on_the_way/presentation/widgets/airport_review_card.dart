import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Карточка отзыва об аэропорте
class AirportReviewCard extends StatelessWidget {
  final AirportReviewEntity review;
  final bool canDelete;
  final bool canEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReply;
  final bool isReply;
  final void Function(BuildContext, List<String>, int)? onPhotoTap;
  final void Function(int, String)? onDeletePhoto; // Callback для удаления фотографии (reviewId, photoUrl)

  const AirportReviewCard({
    super.key,
    required this.review,
    this.canDelete = false,
    this.canEdit = false,
    this.onDelete,
    this.onEdit,
    this.onReply,
    this.isReply = false,
    this.onPhotoTap,
    this.onDeletePhoto,
  });

  String getImageUrl(String photoUrl) {
    if (photoUrl.startsWith('http://') || photoUrl.startsWith('https://')) {
      return photoUrl;
    }
    return '${getBackUrl(useLocal: true)}/$photoUrl';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 12.h),
                if (review.rating != null && review.rating! > 0) ...[
                  RatingWidget(rating: review.rating!, size: 16),
                  SizedBox(height: 12.h),
                ],
                if (review.comment != null && review.comment!.isNotEmpty) ...[_buildComment(), SizedBox(height: 12.h)],
                if (review.hasPhotos) ...[_buildPhotos(context), SizedBox(height: 12.h)],
                if (onReply != null && !isReply) _buildReplyButton(),
              ],
            ),
          ),
          _buildCreatedAtDate(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  /// Заголовок с аватаром и именем
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(context, review.reviewerAvatarUrl, 40.r),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review.reviewerName, style: AppStyles.bold14s.copyWith(color: Color(0xFF1E293B))),
              if (review.createdAt != null) ...[
                SizedBox(height: 4.h),
                Text(
                  formatDate(review.createdAt!),
                  style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// Аватар пользователя
  Widget _buildAvatar(BuildContext context, String? avatarUrl, double size) {
    final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;
    return ClipOval(
      child: imageUrl != null && imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
              cacheManager: GetIt.instance<DefaultCacheManager>(),
              cacheKey: avatarUrl,
              placeholder: (context, url) => Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
              errorWidget: (context, url, error) =>
                  Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
            )
          : Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
    );
  }

  /// Текст комментария
  Widget _buildComment() {
    return Text(review.comment!, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)));
  }

  /// Фотографии из отзыва
  Widget _buildPhotos(BuildContext context) {
    if (!review.hasPhotos) return SizedBox.shrink();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1.0,
      ),
      itemCount: review.photoUrls!.length,
      itemBuilder: (context, index) {
        final photoUrl = review.photoUrls![index];
        return Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: onPhotoTap != null ? () => onPhotoTap!(context, review.photoUrls!, index) : null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: getImageUrl(photoUrl),
                  fit: BoxFit.cover,
                  cacheManager: GetIt.instance<DefaultCacheManager>(),
                  cacheKey: photoUrl,
                  placeholder: (context, url) => Container(
                    color: Color(0xFFF3F4F6),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Color(0xFFF3F4F6),
                    child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                  ),
                ),
              ),
            ),
            // Кнопка меню в правом верхнем углу
            Positioned(
              top: -4.h,
              right: -4.w,
              child: PopupMenuButton<String>(
                icon: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                  child: Icon(Icons.more_vert, color: Colors.white, size: 16),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                onSelected: (value) {
                  switch (value) {
                    case 'share':
                      _sharePhoto(context, photoUrl);
                      break;
                    case 'download':
                      _downloadPhoto(context, photoUrl);
                      break;
                    case 'delete':
                      if (onDeletePhoto != null) {
                        _showDeletePhotoDialog(context, photoUrl);
                      }
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
                        Icon(Icons.share, size: 20, color: Color(0xFF374151)),
                        SizedBox(width: 12.w),
                        Text('Поделиться', style: AppStyles.regular14s),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'download',
                    child: Row(
                      children: [
                        Icon(Icons.download, size: 20, color: Color(0xFF374151)),
                        SizedBox(width: 12.w),
                        Text('Скачать', style: AppStyles.regular14s),
                      ],
                    ),
                  ),
                  // Кнопка удаления показывается только если пользователь может редактировать отзыв
                  if (canEdit && onDeletePhoto != null)
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, size: 20, color: Colors.red),
                          SizedBox(width: 12.w),
                          Text('Удалить', style: AppStyles.regular14s.copyWith(color: Colors.red)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться фотографией'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Необходимо разрешение на сохранение файлов'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16.w),
              Text('Скачивание...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Для Android используем Downloads, для iOS - Photos
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid
            ? '${directory.path}/Download/$fileName'
            : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось скачать фотографию'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Показать диалог подтверждения удаления фотографии
  void _showDeletePhotoDialog(BuildContext context, String photoUrl) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text('Отмена')),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (onDeletePhoto != null) {
                onDeletePhoto!(review.id, photoUrl);
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );
  }

  /// Кнопка "Ответить"
  Widget _buildReplyButton() {
    return TextButton.icon(
      onPressed: onReply,
      icon: Icon(Icons.reply, size: 16, color: Color(0xFF0A6EFA)),
      label: Text('Ответить', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        minimumSize: Size(0, 0),
      ),
    );
  }

  /// Дата создания в правом верхнем углу
  Widget _buildCreatedAtDate() {
    if (review.createdAt == null) return SizedBox.shrink();

    return Positioned(
      top: 16.h,
      right: 16.w,
      child: Text(
        formatDateWithTime(review.createdAt!),
        style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
      ),
    );
  }

  /// Кнопки управления (редактирование и удаление)
  Widget _buildActionButtons() {
    if (!canEdit && !canDelete) return SizedBox.shrink();

    return Positioned(
      top: 16.h,
      right: 16.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (canEdit && onEdit != null)
            IconButton(
              icon: Icon(Icons.edit_outlined, color: Color(0xFF0A6EFA), size: 20),
              onPressed: onEdit,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          if (canDelete && onDelete != null)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Color(0xFFEF4444), size: 20),
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
        ],
      ),
    );
  }
}

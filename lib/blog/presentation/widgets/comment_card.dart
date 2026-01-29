import 'dart:io';
import 'package:aviapoint/blog/domain/entities/blog_comment_entity.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

/// Карточка комментария к статье
class CommentCard extends StatelessWidget {
  final BlogCommentEntity comment;
  final bool isReply;
  final bool canDelete;
  final bool canEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReply;

  const CommentCard({super.key, required this.comment, this.isReply = false, this.canDelete = false, this.canEdit = false, this.onDelete, this.onEdit, this.onReply});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Дата, кнопки редактирования и удаления в одной строке
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Дата и время слева
                    if (comment.createdAt != null)
                      Text(
                        formatDateWithTime(comment.createdAt!),
                        style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF), fontSize: 10.0),
                      ),
                    // Кнопки редактирования и удаления справа
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Кнопка редактирования
                        if (canEdit && onEdit != null)
                          IconButton(
                            icon: Icon(Icons.edit_outlined, color: Color(0xFF0A6EFA), size: 20.0),
                            onPressed: onEdit,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        // Кнопка удаления
                        if (canDelete && onDelete != null)
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: Color(0xFFEF4444), size: 20.0),
                            onPressed: onDelete,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Автор комментария
                Row(
                  children: [
                    // Аватар автора
                    GestureDetector(
                      onTap: comment.authorAvatarUrl != null && comment.authorAvatarUrl!.isNotEmpty ? () => _showPhotoViewer(context, getImageUrl(comment.authorAvatarUrl!)) : null,
                      child: ClipOval(
                        child: comment.authorAvatarUrl != null && comment.authorAvatarUrl!.isNotEmpty
                            ? NetworkImageWidget(
                                imageUrl: getImageUrl(comment.authorAvatarUrl!),
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                placeholder: Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                                errorWidget: Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                              )
                            : Image.asset(Pictures.pilot, width: 40, height: 40, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(comment.authorName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                          if (comment.authorRating != null && comment.authorRating! > 0) ...[SizedBox(height: 4), RatingWidget(rating: comment.authorRating!.round(), size: 12)],
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Текст комментария
                Text(comment.content, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                // Кнопка "Ответить" (только для основных комментариев, не для ответов)
                if (!isReply && onReply != null) ...[
                  SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: onReply,
                    icon: Icon(Icons.reply, size: 16.0, color: Color(0xFF0A6EFA)),
                    label: Text('Ответить', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                    style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), minimumSize: Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(BuildContext context, String imageUrl) {
    bool showControls = true;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографией
                InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 5.0,
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: NetworkImageWidget(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: Container(
                          color: Colors.black,
                          child: Center(child: CircularProgressIndicator(color: Colors.white)),
                        ),
                        errorWidget: Container(
                          color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.broken_image, color: Colors.white70, size: 64.0),
                                SizedBox(height: 16),
                                Text('Не удалось загрузить изображение', style: AppStyles.regular14s.copyWith(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Верхняя панель с кнопками действий
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 48), // Для центрирования
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24.0),
                                  onPressed: () => _sharePhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24.0),
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28.0),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      await Share.shareUri(Uri.parse(photoUrl));
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось поделиться фотографией'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Правый клик по изображению → "Сохранить как"'), backgroundColor: Colors.blue, duration: Duration(seconds: 3)));
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Необходимо разрешение на сохранение файлов'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
        return;
      }

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16),
              Text('Скачивание...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(photoUrl, filePath);

      // Для Android используем Downloads, для iOS - Photos
      final directory = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid ? '${directory.path}/Download/$fileName' : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Фотография сохранена'), backgroundColor: Colors.green, duration: Duration(seconds: 3)));
      }
    } catch (e) {
      scaffoldMessenger.hideCurrentSnackBar();
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось скачать фотографию: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }
}

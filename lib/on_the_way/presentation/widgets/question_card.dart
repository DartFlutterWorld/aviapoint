import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

/// Карточка вопроса пилоту
class QuestionCard extends StatelessWidget {
  final FlightQuestionEntity question;
  final bool canDelete;
  final bool canEdit;
  final bool canAnswer;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onAnswer;
  final double? pilotRating; // Рейтинг пилота для отображения

  const QuestionCard({
    super.key,
    required this.question,
    this.canDelete = false,
    this.canEdit = false,
    this.canAnswer = false,
    this.onDelete,
    this.onEdit,
    this.onAnswer,
    this.pilotRating,
  });

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
                SizedBox(height: 16.h), // Отступ сверху для даты
                // Вопрос
                Row(
                  children: [
                    // Аватар автора вопроса
                    GestureDetector(
                      onTap: question.authorAvatarUrl != null && question.authorAvatarUrl!.isNotEmpty
                          ? () => _showPhotoViewer(context, getImageUrl(question.authorAvatarUrl!))
                          : null,
                      child: ClipOval(
                        child: question.authorAvatarUrl != null && question.authorAvatarUrl!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: getImageUrl(question.authorAvatarUrl!),
                                width: 40.r,
                                height: 40.r,
                                fit: BoxFit.cover,
                                cacheManager: GetIt.instance<DefaultCacheManager>(),
                                cacheKey: question.authorAvatarUrl,
                                placeholder: (context, url) => Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                                errorWidget: (context, url, error) => Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                              )
                            : Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.authorName,
                            style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                          ),
                        ],
                      ),
                    ),
                    // Кнопки управления (только для автора вопроса)
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
                SizedBox(height: 12.h),
                // Текст вопроса
                Text(
                  question.questionText,
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                ),
                // Ответ пилота (если есть)
                if (question.answerText != null && question.answerText!.isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F9FF), // Светло-голубой фон для ответа
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Color(0xFF0A6EFA).withOpacity(0.2), width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Аватар пилота
                            GestureDetector(
                              onTap: question.answeredByAvatarUrl != null && question.answeredByAvatarUrl!.isNotEmpty
                                  ? () => _showPhotoViewer(context, getImageUrl(question.answeredByAvatarUrl!))
                                  : null,
                              child: ClipOval(
                                child: question.answeredByAvatarUrl != null && question.answeredByAvatarUrl!.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: getImageUrl(question.answeredByAvatarUrl!),
                                        width: 40.r,
                                        height: 40.r,
                                        fit: BoxFit.cover,
                                        cacheManager: GetIt.instance<DefaultCacheManager>(),
                                        cacheKey: question.answeredByAvatarUrl,
                                        placeholder: (context, url) => Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                                        errorWidget: (context, url, error) => Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                                      )
                                    : Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        question.answeredByName ?? 'Пилот',
                                        style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA)),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        '(Пилот)',
                                        style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                      ),
                                    ],
                                  ),
                                  if (pilotRating != null && pilotRating! > 0) ...[
                                    SizedBox(height: 4.h),
                                    RatingWidget(rating: pilotRating!.round(), size: 12),
                                  ],
                                ],
                              ),
                            ),
                            // Кнопки управления (только для пилота)
                            if (canEdit && onEdit != null && question.answeredById != null)
                              IconButton(
                                icon: Icon(Icons.edit_outlined, color: Color(0xFF0A6EFA), size: 20),
                                onPressed: onEdit,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            if (canDelete && onDelete != null && question.answeredById != null)
                              IconButton(
                                icon: Icon(Icons.delete_outline, color: Color(0xFFEF4444), size: 20),
                                onPressed: onDelete,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        // Текст ответа
                        Text(
                          question.answerText!,
                          style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                        ),
                      ],
                    ),
                  ),
                ] else if (canAnswer && onAnswer != null) ...[
                  // Кнопка "Ответить" (только для пилота, если ответа еще нет)
                  SizedBox(height: 12.h),
                  TextButton.icon(
                    onPressed: onAnswer,
                    icon: Icon(Icons.reply, size: 16, color: Color(0xFF0A6EFA)),
                    label: Text('Ответить', style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA))),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Дата и время в правом верхнем углу
          if (question.createdAt != null)
            Positioned(
              top: 8.h,
              right: 12.w,
              child: Text(
                DateFormat('dd.MM.yyyy HH:mm').format(question.createdAt!),
                style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF), fontSize: 10.sp),
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
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        cacheManager: GetIt.instance<DefaultCacheManager>(),
                        placeholder: (context, url) => Container(
                          color: Colors.black,
                          child: Center(child: CircularProgressIndicator(color: Colors.white)),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                SizedBox(height: 16.h),
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
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 48.w), // Для центрирования
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
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

      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(photoUrl, filePath);

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
      scaffoldMessenger.hideCurrentSnackBar();
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось скачать фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}


import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_waypoint_entity.dart';
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

/// Карточка отзыва
class ReviewCard extends StatelessWidget {
  final ReviewEntity review;
  final bool canDelete;
  final bool canEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReply;
  final VoidCallback onTap; // Обработчик нажатия на чип "К полёту"
  final bool isReply;
  final String? reviewedName;
  final String? reviewedAvatarUrl;
  final double? reviewedRating;
  // Явная информация о рецензенте (для отзывов о пассажирах - пилот)
  final String? reviewerName;
  final String? reviewerAvatarUrl;
  final double? reviewerRating;
  // Информация о полёте (для отзывов на странице профиля)
  final String? departureAirport;
  final String? arrivalAirport;
  final DateTime? departureDate;
  final List<FlightWaypointEntity>? waypoints;

  const ReviewCard({
    super.key,
    required this.review,
    this.canDelete = false,
    this.canEdit = false,
    this.onDelete,
    this.onEdit,
    this.onReply,
    required this.onTap,
    this.isReply = false,
    this.reviewedName,
    this.reviewedAvatarUrl,
    this.reviewedRating,
    this.reviewerName,
    this.reviewerAvatarUrl,
    this.reviewerRating,
    this.departureAirport,
    this.arrivalAirport,
    this.departureDate,
    this.waypoints,
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
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [if (!isReply && reviewedName != null) _buildReviewerBlock(context) else _buildProfileHeader(context), _buildComment(), _buildReplyButton()],
            ),
          ),
          _buildCreatedAtDate(),
        ],
      ),
    );
  }

  /// Блок "Кто оставил → О ком отзыв"
  Widget _buildReviewerBlock(BuildContext context) {
    return Column(
              children: [
        SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Color(0xFFE5E7EB), width: 1.5),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: Offset(0, 2))],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (reviewerName != null) ...[
                _buildAvatar(context, reviewerAvatarUrl, 40.r),
                          SizedBox(width: 8.w),
                Expanded(child: _buildReviewerInfo(reviewerName!, reviewerRating)),
                          SizedBox(width: 12.w),
                          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 12.w),
                        ],
              _buildAvatar(context, reviewedAvatarUrl, 40.r, withBorder: true),
                        SizedBox(width: 8.w),
              Expanded(child: _buildReviewedInfo(reviewedName!, reviewedRating)),
                            ],
                          ),
                        ),
        _buildActionButtons(),
                      ],
    );
  }

  /// Заголовок для отзывов в профиле
  Widget _buildProfileHeader(BuildContext context) {
    return Row(
                    children: [
        _buildAvatar(context, review.reviewerAvatarUrl, 40.r),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
              if (!isReply && reviewedName == null) SizedBox(height: 12.h),
              _buildProfileReviewerName(),
              if (!isReply && reviewedName == null) _buildFlightInfo(),
            ],
          ),
        ),
        _buildActionButtons(),
      ],
    );
  }

  /// Имя рецензента с рейтингом для профиля
  Widget _buildProfileReviewerName() {
    if (!isReply && reviewedName == null && review.rating != null && review.rating! > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(review.reviewerName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                                  SizedBox(width: 4.w),
                                  Text('оценил вас в', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  SizedBox(width: 4.w),
                                  Text(review.rating!.toStringAsFixed(1), style: AppStyles.bold12s.copyWith(color: Color(0xFF0A6EFA))),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              RatingWidget(rating: review.rating!, size: 12),
        ],
      );
    }
    return Text(review.reviewerName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)));
  }

  /// Информация о полёте (маршрут и дата)
  Widget _buildFlightInfo() {
    final hasFlightInfo = departureAirport != null || arrivalAirport != null || (waypoints != null && waypoints!.isNotEmpty);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                              SizedBox(height: 8.h),
        if (hasFlightInfo) _buildRoute(),
        _buildDepartureDate(),
      ],
    );
  }

  /// Маршрут полёта
  Widget _buildRoute() {
    if (waypoints != null && waypoints!.isNotEmpty) {
                                    final sortedWaypoints = List<FlightWaypointEntity>.from(waypoints!)..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder));

                                    return Wrap(
                                      spacing: 4.w,
                                      runSpacing: 4.h,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        ...sortedWaypoints.asMap().entries.expand((entry) {
                                          final index = entry.key;
                                          final waypoint = entry.value;
                                          final isFirst = index == 0;
                                          final isLast = index == sortedWaypoints.length - 1;

                                          return [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight), size: 14, color: Color(0xFF9CA5AF)),
                                                SizedBox(width: 4.w),
                                                Text(waypoint.airportCode, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                              ],
                                            ),
                                            if (!isLast) ...[SizedBox(width: 4.w), Icon(Icons.arrow_forward, size: 14, color: Color(0xFF0A6EFA)), SizedBox(width: 4.w)],
                                          ];
                                        }).toList(),
                                      ],
                                    );
    }

    if (departureAirport != null || arrivalAirport != null) {
      return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.flight_takeoff, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(departureAirport ?? '—', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                    SizedBox(width: 8.w),
                                    Icon(Icons.arrow_forward, size: 14, color: Color(0xFF0A6EFA)),
                                    SizedBox(width: 8.w),
                                    Text(arrivalAirport ?? '—', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
      );
    }

    return SizedBox.shrink();
  }

  /// Дата вылета с чипом "К полёту"
  Widget _buildDepartureDate() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          if (departureDate != null)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.calendar_today, size: 14, color: Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(DateFormat('dd.MM.yyyy').format(departureDate!), style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
                                ),
          if (departureDate != null) Spacer(),
          _buildFlightChip(),
                            ],
      ),
    );
  }

  /// Чип "К полёту"
  Widget _buildFlightChip() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(color: Color(0xFF0A6EFA).withOpacity(0.1), borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flight_takeoff, size: 14, color: Color(0xFF0A6EFA)),
            SizedBox(width: 4.w),
            Text('К полёту', style: AppStyles.regular12s.copyWith(color: Color(0xFF0A6EFA))),
                          ],
                        ),
                      ),
    );
  }

  /// Аватар пользователя
  Widget _buildAvatar(BuildContext context, String? avatarUrl, double size, {bool withBorder = false}) {
    final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;
    final avatar = ClipOval(
      child: imageUrl != null && imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
              cacheManager: GetIt.instance<DefaultCacheManager>(),
              cacheKey: avatarUrl,
              placeholder: (context, url) => Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
              errorWidget: (context, url, error) => Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
            )
          : Image.asset(Pictures.pilot, width: size, height: size, fit: BoxFit.cover),
    );

    final child = withBorder
        ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: avatar,
          )
        : avatar;

    return GestureDetector(onTap: imageUrl != null && imageUrl.isNotEmpty ? () => _showPhotoViewer(context, imageUrl) : null, child: child);
  }

  /// Информация о рецензенте
  Widget _buildReviewerInfo(String name, double? rating) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyles.bold14s.copyWith(color: Color(0xFF1E293B)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (rating != null && rating > 0) ...[SizedBox(height: 4.h), RatingWidget(rating: rating.round(), size: 12)],
      ],
    );
  }

  /// Информация о том, о ком отзыв
  Widget _buildReviewedInfo(String name, double? rating) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyles.bold14s.copyWith(color: Color(0xFF1E293B)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (rating != null) ...[
          SizedBox(height: 4.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingWidget(rating: rating.round().clamp(1, 5), size: 12),
              SizedBox(width: 6.w),
              Text(rating.toStringAsFixed(1), style: AppStyles.bold12s.copyWith(color: Color(0xFF0A6EFA))),
            ],
          ),
        ],
      ],
    );
  }

  /// Кнопки управления (редактирование и удаление)
  Widget _buildActionButtons() {
    if (!canEdit && !canDelete) return SizedBox.shrink();

    return Row(
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
    );
  }

  /// Текст комментария
  Widget _buildComment() {
    if (review.comment == null || review.comment!.isEmpty) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Text(review.comment!, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
    );
  }

  /// Кнопка "Ответить"
  Widget _buildReplyButton() {
    if (isReply || onReply == null) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: TextButton.icon(
                    onPressed: onReply,
                    icon: Icon(Icons.reply, size: 16, color: Color(0xFF0A6EFA)),
                    label: Text('Ответить', style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA))),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
    );
  }

  /// Дата создания отзыва в правом верхнем углу
  Widget _buildCreatedAtDate() {
    if (review.createdAt == null) return SizedBox.shrink();

    return Positioned(
              top: 8.h,
              right: 12.w,
              child: Text(
                DateFormat('dd.MM.yyyy HH:mm').format(review.createdAt!),
                style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF), fontSize: 10.sp),
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
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
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
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, imageUrl),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
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
      final directory = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid ? '${directory.path}/Download/$fileName' : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Фотография сохранена'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
      }
    } catch (e) {
      scaffoldMessenger.hideCurrentSnackBar();
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось скачать фотографию: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }
}

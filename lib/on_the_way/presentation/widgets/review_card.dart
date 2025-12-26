import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

/// Карточка отзыва
class ReviewCard extends StatelessWidget {
  final ReviewEntity review;
  final bool canDelete;
  final bool canEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReply;
  final bool isReply;
  final String? reviewedName;
  final String? reviewedAvatarUrl;
  final double? reviewedRating;

  const ReviewCard({
    super.key,
    required this.review,
    this.canDelete = false,
    this.canEdit = false,
    this.onDelete,
    this.onEdit,
    this.onReply,
    this.isReply = false,
    this.reviewedName,
    this.reviewedAvatarUrl,
    this.reviewedRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Аватар рецензента (используем ту же логику, что и в профиле)
              ClipOval(
                child: Builder(
                  builder: (context) {
                    final avatarUrl = review.reviewerAvatarUrl;
                    if (avatarUrl != null && avatarUrl.isNotEmpty) {
                      final imageUrl = getImageUrl(avatarUrl);
                      if (imageUrl.isNotEmpty) {
                        // Логирование для диагностики
                        print('🔵 [ReviewCard] Загружаем аватар: avatarUrl=$avatarUrl, imageUrl=$imageUrl');
                        return CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 40.r,
                          height: 40.r,
                          fit: BoxFit.cover,
                          cacheManager: GetIt.instance<DefaultCacheManager>(),
                          cacheKey: avatarUrl,
                          placeholder: (context, url) =>
                              Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover),
                          errorWidget: (context, url, error) {
                            print(
                              '❌ [ReviewCard] Ошибка загрузки аватара: error=$error, url=$url, avatarUrl=$avatarUrl',
                            );
                            return Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover);
                          },
                        );
                      }
                    }
                    return Image.asset(Pictures.pilot, width: 40.r, height: 40.r, fit: BoxFit.cover);
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.reviewerName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    if (review.createdAt != null)
                      Text(
                        DateFormat('dd.MM.yyyy HH:mm').format(review.createdAt!),
                        style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                  ],
                ),
              ),
              // Рейтинг (только для основных отзывов, не для ответов)
              if (review.rating != null) RatingWidget(rating: review.rating, size: 16),
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
          // Информация о том, о ком оставлен отзыв (только для основных отзывов, не для ответов)
          if (!isReply && reviewedName != null) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  Icon(Icons.person_outline, size: 16, color: Color(0xFF9CA5AF)),
                  SizedBox(width: 8.w),
                  Text('Отзыв о: ', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                  SizedBox(width: 8.w),
                  // Аватар reviewed пользователя
                  if (reviewedAvatarUrl != null && reviewedAvatarUrl!.isNotEmpty)
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: getImageUrl(reviewedAvatarUrl!),
                        width: 24.r,
                        height: 24.r,
                        fit: BoxFit.cover,
                        cacheManager: GetIt.instance<DefaultCacheManager>(),
                        cacheKey: reviewedAvatarUrl,
                        placeholder: (context, url) =>
                            Image.asset(Pictures.pilot, width: 24.r, height: 24.r, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            Image.asset(Pictures.pilot, width: 24.r, height: 24.r, fit: BoxFit.cover),
                      ),
                    )
                  else
                    ClipOval(
                      child: Image.asset(Pictures.pilot, width: 24.r, height: 24.r, fit: BoxFit.cover),
                    ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      reviewedName!,
                      style: AppStyles.bold12s.copyWith(color: Color(0xFF374151)),
                    ),
                  ),
                  if (reviewedRating != null && reviewedRating! > 0) ...[
                    SizedBox(width: 8.w),
                    RatingWidget(rating: reviewedRating!.round(), size: 12),
                  ],
                ],
              ),
            ),
          ],
          if (review.comment != null && review.comment!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Text(review.comment!, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
          ],
          if (!isReply && onReply != null) ...[
            SizedBox(height: 12.h),
            TextButton.icon(
              onPressed: onReply,
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
    );
  }
}

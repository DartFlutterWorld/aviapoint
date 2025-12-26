import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_stars_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class PilotInfoWidget extends StatelessWidget {
  final String? pilotName;
  final double rating;
  final int reviewsCount;
  final String? avatarUrl;

  const PilotInfoWidget({super.key, this.pilotName, this.rating = 0.0, this.reviewsCount = 0, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final displayName = pilotName ?? 'Пилот';
    final displayRating = rating > 0 ? rating : 0.0;
    final displayReviewsCount = reviewsCount;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFD9E6F8)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Аватар
          ClipOval(
            child: avatarUrl != null && avatarUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: getImageUrl(avatarUrl!),
                    width: 48.r,
                    height: 48.r,
                    fit: BoxFit.cover,
                    cacheManager: GetIt.instance<DefaultCacheManager>(),
                    cacheKey: avatarUrl,
                    placeholder: (context, url) =>
                        Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover),
                    errorWidget: (context, url, error) {
                      print(
                        '❌ [PilotInfoWidget] Ошибка загрузки аватара пилота: error=$error, url=$url, avatarUrl=$avatarUrl',
                      );
                      return Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover);
                    },
                  )
                : Image.asset(Pictures.pilot, width: 48.r, height: 48.r, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          // Информация
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(displayName, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 4.h),
                if (displayRating > 0) ...[RatingStarsWidget(rating: displayRating), SizedBox(height: 4.h)],
                if (displayReviewsCount > 0)
                  Text(
                    '$displayReviewsCount ${_getReviewsText(displayReviewsCount)}',
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                  )
                else if (displayRating > 0)
                  Text('Нет отзывов', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getReviewsText(int count) {
    if (count % 10 == 1 && count % 100 != 11) {
      return 'отзыв';
    } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
      return 'отзыва';
    } else {
      return 'отзывов';
    }
  }
}

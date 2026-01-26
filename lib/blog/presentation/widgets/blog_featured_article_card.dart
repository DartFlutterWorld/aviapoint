import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class BlogFeaturedArticleCard extends StatelessWidget {
  final BlogArticleEntity article;
  final VoidCallback? onTap;

  const BlogFeaturedArticleCard({super.key, required this.article, this.onTap});


  String _getAuthorName() {
    if (article.author == null) return 'Автор';
    final firstName = article.author!.firstName ?? '';
    final lastName = article.author!.lastName ?? '';
    if (firstName.isEmpty && lastName.isEmpty) {
      return article.author!.phone;
    }
    return '$firstName $lastName'.trim();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFD9E6F8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                  child: CachedNetworkImage(
                    imageUrl: article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty
                        ? getImageUrl(article.coverImageUrl!)
                        : '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                    placeholder: (context, url) => Shimmer(
                      duration: const Duration(milliseconds: 1000),
                      color: const Color(0xFF8D66FE),
                      colorOpacity: 0.2,
                      child: Container(decoration: const BoxDecoration()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200.h,
                      color: const Color(0xFFD9E6F8),
                      child: Icon(Icons.image, size: 48.sp),
                    ),
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(color: AppColors.primary100p, borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 14.sp, color: Colors.white),
                        SizedBox(width: 4.w),
                        Text('Рекомендуемое', style: AppStyles.regular12s.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (article.category != null)
                        Text(
                          article.category!.name.toUpperCase(),
                          style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                        ),
                      Text(
                        article.publishedAt != null ? formatDate(DateTime.parse(article.publishedAt!)) : '',
                        style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    article.title,
                    style: AppStyles.bold16s.copyWith(color: const Color(0xFF374151)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (article.excerpt != null && article.excerpt!.isNotEmpty) ...[
                    SizedBox(height: 5.h),
                    Text(
                      article.excerpt!,
                      style: AppStyles.light12s.copyWith(color: const Color(0xFF4B5767)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 4.h,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person_outline, size: 12.sp, color: const Color(0xFF9CA5AF)),
                          SizedBox(width: 4.w),
                          Text(_getAuthorName(), style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF))),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.visibility_outlined, size: 12.sp, color: const Color(0xFF9CA5AF)),
                          SizedBox(width: 4.w),
                          Text(
                            '${article.viewCount}',
                            style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                          ),
                        ],
                      ),
                      if (article.aircraftModel != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.flight, size: 12.sp, color: const Color(0xFF9CA5AF)),
                            SizedBox(width: 4.w),
                            Flexible(
                              child: Text(
                                article.aircraftModel!.getFullName(),
                                style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

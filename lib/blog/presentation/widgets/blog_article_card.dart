import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class BlogArticleCard extends StatelessWidget {
  final BlogArticleEntity article;
  final VoidCallback? onTap;
  final bool showStatus;

  const BlogArticleCard({super.key, required this.article, this.onTap, this.showStatus = false});

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    try {
      final parsed = DateTime.parse(date);
      return '${parsed.day.toString().padLeft(2, '0')}.${parsed.month.toString().padLeft(2, '0')}.${parsed.year}';
    } catch (e) {
      return date;
    }
  }

  String _getAuthorName() {
    if (article.author == null) return 'Автор';
    final firstName = article.author!.firstName ?? '';
    final lastName = article.author!.lastName ?? '';
    if (firstName.isEmpty && lastName.isEmpty) {
      return article.author!.phone;
    }
    return '$firstName $lastName'.trim();
  }

  String _getStatusText() {
    switch (article.status) {
      case 'published':
        return 'Опубликовано';
      case 'draft':
        return 'Черновик';
      case 'archived':
        return 'Архив';
      default:
        return article.status;
    }
  }

  Color _getStatusColor() {
    switch (article.status) {
      case 'published':
        return const Color(0xFF10B981); // Зеленый
      case 'draft':
        return const Color(0xFFF59E0B); // Оранжевый
      case 'archived':
        return const Color(0xFF9CA5AF); // Серый
      default:
        return const Color(0xFF9CA5AF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD9E6F8)),
        ),
        child: Stack(
          children: [
            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: getImageUrl(article.coverImageUrl!),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer(
                    duration: const Duration(milliseconds: 1000),
                    color: const Color(0xFF8D66FE),
                    colorOpacity: 0.2,
                    child: Container(decoration: const BoxDecoration()),
                  ),
                  height: 75.h,
                  width: 75.w,
                ),
              ),
            if (article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty) SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        _formatDate(article.publishedAt),
                        style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    article.title,
                    style: AppStyles.medium14s.copyWith(color: const Color(0xFF374151)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (article.excerpt != null && article.excerpt!.isNotEmpty) ...[
                    SizedBox(height: 5.h),
                    Text(
                      article.excerpt!,
                      style: AppStyles.light10s.copyWith(color: const Color(0xFF4B5767)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 8.h),
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
                      Text('${article.viewCount}', style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF))),
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
                  if (showStatus) ...[
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: _getStatusColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getStatusText(),
                          style: AppStyles.light10s.copyWith(
                            color: Colors.white,
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

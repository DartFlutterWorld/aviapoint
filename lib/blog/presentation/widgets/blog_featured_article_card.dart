import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class BlogFeaturedArticleCard extends StatefulWidget {
  final BlogArticleEntity article;
  final VoidCallback? onTap;

  const BlogFeaturedArticleCard({super.key, required this.article, this.onTap});

  @override
  State<BlogFeaturedArticleCard> createState() => _BlogFeaturedArticleCardState();
}

class _BlogFeaturedArticleCardState extends State<BlogFeaturedArticleCard> {
  String _getAuthorName() {
    if (widget.article.author == null) return 'Автор';
    final firstName = widget.article.author!.firstName ?? '';
    final lastName = widget.article.author!.lastName ?? '';
    if (firstName.isEmpty && lastName.isEmpty) {
      return widget.article.author!.phone;
    }
    return '$firstName $lastName'.trim();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD9E6F8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: widget.article.coverImageUrl != null && widget.article.coverImageUrl!.isNotEmpty
                      ? NetworkImageWidget(
                          imageUrl: getImageUrl(widget.article.coverImageUrl!),
                          fit: BoxFit.fill, // Как в новостях - без ограничений по высоте
                          errorWidget: Container(color: const Color(0xFFD9E6F8), child: Icon(Icons.image, size: 48)),
                        )
                      : Container(color: const Color(0xFFD9E6F8), child: Icon(Icons.image, size: 48)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.article.category != null)
                        Text(
                          widget.article.category!.name.toUpperCase(),
                          style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                        ),
                      Text(
                        widget.article.publishedAt != null
                            ? formatDate(DateTime.parse(widget.article.publishedAt!))
                            : '',
                        style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.article.title,
                    style: AppStyles.bold14s.copyWith(color: const Color(0xFF374151)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.article.excerpt != null && widget.article.excerpt!.isNotEmpty) ...[
                    SizedBox(height: 4),
                    Text(
                      widget.article.excerpt!,
                      style: AppStyles.light10s.copyWith(color: const Color(0xFF4B5767)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person_outline, size: 12, color: const Color(0xFF9CA5AF)),
                          SizedBox(width: 4),
                          Text(_getAuthorName(), style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF))),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.visibility_outlined, size: 12, color: const Color(0xFF9CA5AF)),
                          SizedBox(width: 4),
                          Text(
                            '${widget.article.viewCount}',
                            style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                          ),
                        ],
                      ),
                      if (widget.article.aircraftModel != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.flight, size: 12.0, color: const Color(0xFF9CA5AF)),
                            SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.article.aircraftModel!.getFullName(),
                                style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

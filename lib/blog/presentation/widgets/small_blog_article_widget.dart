import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

class SmallBlogArticleWidget extends StatelessWidget {
  const SmallBlogArticleWidget({super.key, required this.article, this.showStatus = false});

  final BlogArticleEntity article;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFD9E6F8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty
                ? NetworkImageWidget(
                    imageUrl: getImageUrl(article.coverImageUrl!),
                    fit: BoxFit.fill,
                    height: 75,
                    width: 75,
                  )
                : Container(
                    height: 75,
                    width: 75,
                    color: Color(0xFFD9E6F8),
                    child: Icon(Icons.image, size: 32, color: Color(0xFF9CA5AF)),
                  ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showStatus)
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: StatusChip(
                      text: article.status == 'published' ? 'Опубликовано' : 'Не опубликовано',
                      backgroundColor: article.status == 'published'
                          ? const Color(0xFF10B981)
                          : const Color(0xFFF59E0B),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                      borderRadius: 10,
                      height: 20,
                      textStyle: AppStyles.regular10s.copyWith(color: Colors.white),
                    ),
                  ),
                SizedBox(height: 5),
                Text(article.title, style: AppStyles.medium14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 5),
                if (article.excerpt != null && article.excerpt!.isNotEmpty)
                  Text(article.excerpt!, style: AppStyles.light10s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 4),
                // Дата в правом нижнем углу
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    article.publishedAt != null ? formatDate(DateTime.parse(article.publishedAt!)) : '',
                    style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF), fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

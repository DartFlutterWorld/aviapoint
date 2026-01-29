import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

class BigBlogArticleWidget extends StatelessWidget {
  final BlogArticleEntity article;
  final bool showStatus;

  const BigBlogArticleWidget({super.key, required this.article, this.showStatus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFD9E6F8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty
                    ? NetworkImageWidget(imageUrl: getImageUrl(article.coverImageUrl!), fit: BoxFit.fill)
                    : Container(
                        height: 200,
                        color: Color(0xFFD9E6F8),
                        child: Icon(Icons.image, size: 48, color: Color(0xFF9CA5AF)),
                      ),
              ),
              if (showStatus)
                Positioned(
                  top: 8,
                  right: 8,
                  child: StatusChip(
                    text: article.status == 'published' ? 'Опубликовано' : 'Не опубликовано',
                    backgroundColor: article.status == 'published' ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                    borderRadius: 10,
                  ),
                ),
            ],
          ),
          SizedBox(height: 9),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(article.title, style: AppStyles.medium14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 5),
                if (article.excerpt != null && article.excerpt!.isNotEmpty) Text(article.excerpt!, style: AppStyles.light10s.copyWith(color: Color(0xFF4B5767))),
                SizedBox(height: 8),
                // Дата в правом нижнем углу
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(article.publishedAt != null ? formatDate(DateTime.parse(article.publishedAt!)) : '', style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF), fontSize: 8)),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlogArticlesWidget extends StatefulWidget {
  final int userId;

  const MyBlogArticlesWidget({super.key, required this.userId});

  @override
  State<MyBlogArticlesWidget> createState() => _MyBlogArticlesWidgetState();
}

class _MyBlogArticlesWidgetState extends State<MyBlogArticlesWidget> {
  @override
  void initState() {
    super.initState();
    // Загружаем статьи пользователя
    context.read<BlogArticlesBloc>().add(
      GetBlogArticlesEvent(
        authorId: widget.userId,
        status: null, // Показываем все статусы (опубликованные и неопубликованные)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogArticlesBloc, BlogArticlesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Мой авиажурнал', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 12),
            state.maybeWhen(
              loading: () => Center(
                child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
              ),
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                ),
              ),
              success: (articles, hasMore) => _buildArticlesList(context, articles),
              orElse: () => SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildArticlesList(BuildContext context, List<BlogArticleEntity> articles) {
    if (articles.isEmpty) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.article_outlined, size: 48, color: Color(0xFF9CA5AF)),
              SizedBox(height: 12),
              Text('У вас пока нет статей', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
            ],
          ),
        ),
      );
    }

    // Сортируем статьи по дате публикации/создания (новые сверху)
    final sortedArticles = [...articles]..sort((a, b) {
        final aDate = a.publishedAt ?? a.createdAt ?? '';
        final bDate = b.publishedAt ?? b.createdAt ?? '';
        return _parseBlogDateTime(bDate).compareTo(_parseBlogDateTime(aDate));
      });

    return SizedBox(
      height: 200, // Фиксированная высота для горизонтального списка
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: sortedArticles.length,
        itemBuilder: (context, index) {
          final article = sortedArticles[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.7, // Ширина карточки
            margin: EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                context.router.push(
                  BaseRoute(
                    children: [
                      BlogNavigationRoute(children: [BlogArticleDetailRoute(articleId: article.id)]),
                    ],
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty
                        ? NetworkImageWidget(
                            imageUrl: getImageUrl(article.coverImageUrl!),
                            fit: BoxFit.cover,
                            errorWidget: Container(
                              color: const Color(0xFFD9E6F8),
                              child: const Icon(Icons.article, size: 48, color: Color(0xFF9CA5AF)),
                            ),
                          )
                        : Container(
                            color: const Color(0xFFD9E6F8),
                            child: const Icon(Icons.article, size: 48, color: Color(0xFF9CA5AF)),
                          ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFE8D5FF).withOpacity(0.95),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          article.title,
                          style: AppStyles.regular12s.copyWith(color: Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  DateTime _parseBlogDateTime(String? value) {
    if (value == null || value.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    final iso = DateTime.tryParse(value);
    if (iso != null) return iso;
    return DateTime.fromMillisecondsSinceEpoch(0);
  }
}

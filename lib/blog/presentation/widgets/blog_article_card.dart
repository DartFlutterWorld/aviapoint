import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class BlogArticleCard extends StatefulWidget {
  final BlogArticleEntity article;
  final VoidCallback? onTap;
  final bool showStatus;

  const BlogArticleCard({super.key, required this.article, this.onTap, this.showStatus = false});

  @override
  State<BlogArticleCard> createState() => _BlogArticleCardState();
}

class _BlogArticleCardState extends State<BlogArticleCard> {
  bool? _isHorizontal;
  bool _isLoadingSize = true;

  @override
  void initState() {
    super.initState();
    if (widget.article.coverImageUrl != null && widget.article.coverImageUrl!.isNotEmpty) {
      _loadImageSize();
    } else {
      _isLoadingSize = false;
    }
  }

  Future<void> _loadImageSize() async {
    try {
      final imageProvider = NetworkImage(getImageUrl(widget.article.coverImageUrl!));
      final imageStream = imageProvider.resolve(ImageConfiguration.empty);
      imageStream.addListener(
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
          if (mounted && _isLoadingSize) {
            final size = Size(info.image.width.toDouble(), info.image.height.toDouble());
            final isHorizontal = size.width > size.height;

            if (synchronousCall) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && _isLoadingSize) {
                  setState(() {
                    _isHorizontal = isHorizontal;
                    _isLoadingSize = false;
                  });
                }
              });
            } else {
              setState(() {
                _isHorizontal = isHorizontal;
                _isLoadingSize = false;
              });
            }
          }
        }),
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingSize = false;
        });
      }
    }
  }

  String _getAuthorName() {
    if (widget.article.author == null) return 'Автор';
    final firstName = widget.article.author!.firstName ?? '';
    final lastName = widget.article.author!.lastName ?? '';
    if (firstName.isEmpty && lastName.isEmpty) {
      return widget.article.author!.phone;
    }
    return '$firstName $lastName'.trim();
  }

  String _getStatusText() {
    switch (widget.article.status) {
      case 'published':
        return 'Опубликовано';
      case 'draft':
        return 'Черновик';
      case 'archived':
        return 'Архив';
      default:
        return widget.article.status;
    }
  }

  Color _getStatusColor() {
    switch (widget.article.status) {
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
    // Для горизонтальных изображений делаем меньше высоту, для вертикальных - больше ширина
    final imageWidth = _isHorizontal == true ? 60.0 : 60.0;
    final imageHeight = _isHorizontal == true ? 60.0 : 80.0;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD9E6F8)),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.article.coverImageUrl != null && widget.article.coverImageUrl!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: NetworkImageWidget(
                      imageUrl: getImageUrl(widget.article.coverImageUrl!),
                      fit: BoxFit.cover,
                      height: imageHeight,
                      width: imageWidth,
                    ),
                  ),
                if (widget.article.coverImageUrl != null && widget.article.coverImageUrl!.isNotEmpty)
                  SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: AppStyles.medium14s.copyWith(color: const Color(0xFF374151)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.article.excerpt != null && widget.article.excerpt!.isNotEmpty) ...[
                        SizedBox(height: 4),
                        Text(
                          widget.article.excerpt!,
                          style: AppStyles.light10s.copyWith(color: const Color(0xFF4B5767)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      SizedBox(height: 6),
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person_outline, size: 12.0, color: const Color(0xFF9CA5AF)),
                              SizedBox(width: 4),
                              Text(
                                _getAuthorName(),
                                style: AppStyles.light10s.copyWith(color: const Color(0xFF9CA5AF)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.visibility_outlined, size: 12.0, color: const Color(0xFF9CA5AF)),
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
                      if (widget.showStatus) ...[
                        SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: _getStatusColor(), borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              _getStatusText(),
                              style: AppStyles.light10s.copyWith(color: Colors.white, fontSize: 9),
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

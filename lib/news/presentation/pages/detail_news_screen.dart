import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/core/utils/seo_helper.dart';
import 'package:aviapoint/core/presentation/widgets/photo_viewer.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget {
  final NewsEntity news;
  final int newsId;

  const DetailNewsScreen({super.key, @PathParam('id') required this.newsId, required this.news});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  NewsEntity? _currentNews;

  void openSource(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  /// Поделиться новостью
  void _shareNews() {
    final news = _currentNews ?? widget.news;
    final baseUrl = kIsWeb ? 'https://avia-point.com' : 'https://avia-point.com';
    final newsUrl = '$baseUrl/news/${widget.newsId}';
    Share.share('${news.title}\n\n$newsUrl\n\nЧитайте в AviaPoint');
  }


  @override
  void initState() {
    super.initState();
    _currentNews = widget.news;
    // Загружаем полные данные новости (включая дополнительные изображения)
    _loadFullNews();
    // Устанавливаем SEO метатеги для страницы новости
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSeoTags();
    });
  }

  Future<void> _loadFullNews() async {
    final repository = getIt<NewsRepository>();
    final result = await repository.getNewsById(id: widget.newsId);
    result.fold(
      (failure) {
        // Ошибка загрузки - оставляем данные из widget.news
        debugPrint('❌ [DetailNewsScreen] Ошибка загрузки новости: ${failure.message}');
      },
      (news) {
        if (mounted) {
          debugPrint('✅ [DetailNewsScreen] Загружена новость ID: ${news.id}, additionalImages: ${news.additionalImages?.length ?? 0}');
          if (news.additionalImages != null && news.additionalImages!.isNotEmpty) {
            debugPrint('📸 [DetailNewsScreen] URLs: ${news.additionalImages}');
          }
          setState(() {
            _currentNews = news;
          });
          _updateSeoTags();
        }
      },
    );
  }

  void _updateSeoTags() {
    final news = _currentNews ?? widget.news;
    SeoHelper.setNewsMetaTags(
      title: news.title,
      description: news.subTitle.isNotEmpty ? news.subTitle : news.title,
      imageUrl: news.pictureBig.isNotEmpty ? news.pictureBig : null,
      newsId: widget.newsId,
      publishedAt: null,
    );
  }

  Future<void> _reloadNews() async {
    final repository = getIt<NewsRepository>();
    final result = await repository.getNewsById(id: widget.newsId);
    result.fold(
      (failure) {
        // Ошибка загрузки - оставляем старые данные
      },
      (news) {
        if (mounted) {
          setState(() {
            _currentNews = news;
          });
          _updateSeoTags();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final news = _currentNews ?? widget.news;
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
    final isAuthor = isAuthenticated && PermissionHelper.isOwnerOrAdmin(news.authorId, context);

    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        state.maybeWhen(
          updated: (updatedNews) {
            // Если обновлена та же новость, перезагружаем данные
            if (updatedNews.id == widget.newsId) {
              _reloadNews();
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
      appBar: CustomAppBar(
        title: 'Новости авиации',
        withBack: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareNews,
            tooltip: 'Поделиться',
          ),
          if (isAuthor)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                await AutoRouter.of(context).push(EditNewsRoute(newsId: news.id));
                // После возврата с экрана редактирования перезагружаем новость
                _reloadNews();
              },
              tooltip: 'Редактировать новость',
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          // padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFD9E6F8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Создаем список всех изображений (обложка + дополнительные)
                      final allImages = <String?>[
                        news.pictureBig,
                        ...(news.additionalImages ?? []),
                      ];
                      PhotoViewer.show(context, allImages, initialIndex: 0);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      child: CachedNetworkImage(
                        imageUrl: getImageUrl(news.pictureBig),
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Shimmer(
                          duration: const Duration(milliseconds: 1000),
                          color: const Color(0xFF8D66FE),
                          colorOpacity: 0.2,
                          child: Container(decoration: const BoxDecoration()),
                        ),
                      ),
                    ),
                  ),
                  // Чипс со статусом для автора в правом верхнем углу (как в блоге)
                  if (Provider.of<AppState>(context, listen: false).isAuthenticated &&
                      PermissionHelper.isOwnerOrAdmin(news.authorId, context))
                    Positioned(
                      top: 16,
                      right: 8,
                      child: StatusChip(
                        text: news.published ? 'Опубликовано' : 'Не опубликовано',
                        backgroundColor: news.published ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        borderRadius: 8,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(news.title, style: AppStyles.medium14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8),
                    // Анонс (subTitle)
                    if (news.subTitle.isNotEmpty) ...[
                      SizedBox(height: 8),
                      Text(
                        news.subTitle,
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                      SizedBox(height: 12),
                    ],
                    // Дата в виде чипа как в блоге
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today, size: 14, color: const Color(0xFF9CA5AF)),
                            SizedBox(width: 4),
                            Text(formatNewsDate(news.date), style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF))),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Контент (Quill или body)
                    if (news.content != null && news.content!.isNotEmpty) ...[
                      _buildQuillContent(news.content!),
                    ] else ...[
                      HtmlWidget(news.body),
                    ],
                    SizedBox(height: 16),
                    // Дополнительные изображения
                    if (news.additionalImages != null && news.additionalImages!.isNotEmpty) ...[
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: news.additionalImages!.length,
                          itemBuilder: (context, index) {
                            final imageUrl = news.additionalImages![index];
                            return GestureDetector(
                              onTap: () {
                                // Создаем список всех изображений (обложка + дополнительные)
                                final allImages = <String?>[
                                  news.pictureBig,
                                  ...(news.additionalImages ?? []),
                                ];
                                // Вычисляем индекс в общем списке (обложка + дополнительные)
                                PhotoViewer.show(context, allImages, initialIndex: 1 + index);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: getImageUrl(imageUrl),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Shimmer(
                                      duration: const Duration(milliseconds: 1000),
                                      color: const Color(0xFF8D66FE),
                                      colorOpacity: 0.2,
                                      child: Container(decoration: const BoxDecoration()),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                    // Источник
                    if (news.source.isNotEmpty) ...[
                      GestureDetector(
                        onTap: () => openSource(news.source),
                        child: Text(
                          news.source,
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA), decoration: TextDecoration.underline, decorationColor: Color(0xFF0A6EFA)),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    ),
    );
  }

  /// Отображает содержимое новости через QuillEditor в read-only режиме
  Widget _buildQuillContent(String content) {
    if (content.isEmpty) {
      return const SizedBox();
    }

    try {
      // Парсим JSON Delta в Document
      final jsonContent = jsonDecode(content);
      final document = Document.fromJson(jsonContent);

      return _QuillReadOnlyViewer(document: document);
    } catch (e) {
      // Если ошибка парсинга - показываем сообщение об ошибке
      debugPrint('❌ Ошибка парсинга JSON Delta: $e');
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Text('Ошибка загрузки содержимого новости', style: AppStyles.regular14s.copyWith(color: Colors.red)),
      );
    }
  }
}

/// Виджет для отображения Quill Document в read-only режиме
class _QuillReadOnlyViewer extends StatefulWidget {
  final Document document;

  const _QuillReadOnlyViewer({required this.document});

  @override
  State<_QuillReadOnlyViewer> createState() => _QuillReadOnlyViewerState();
}

class _QuillReadOnlyViewerState extends State<_QuillReadOnlyViewer> {
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode(skipTraversal: true, canRequestFocus: false);

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic()..document = widget.document;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: QuillEditor.basic(
        controller: _controller,
        config: QuillEditorConfig(
          placeholder: '',
          padding: EdgeInsets.zero,
          embedBuilders: kIsWeb ? FlutterQuillEmbeds.editorWebBuilders() : FlutterQuillEmbeds.editorBuilders(),
        ),
        focusNode: _focusNode,
      ),
    );
  }
}

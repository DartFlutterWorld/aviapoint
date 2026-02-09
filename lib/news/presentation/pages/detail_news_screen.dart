import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
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
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget {
  /// Передаётся при навигации из приложения; при открытии по ссылке (path) может быть null — тогда данные грузятся по newsId.
  final NewsEntity? news;
  final int newsId;

  const DetailNewsScreen({super.key, @PathParam('id') required this.newsId, this.news});

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
    if (news == null) return;
    final baseUrl = kIsWeb ? 'https://avia-point.com' : 'https://avia-point.com';
    final newsUrl = '$baseUrl/news/${widget.newsId}';

    // Форматируем дату
    String? formattedDate;
    if (news.date.isNotEmpty) {
      try {
        // Пробуем разные форматы даты
        DateTime? dateTime;
        try {
          dateTime = DateTime.parse(news.date);
        } catch (_) {
          // Если не удалось распарсить, пробуем другие форматы
          try {
            dateTime = DateFormat('dd.MM.yyyy').parse(news.date);
          } catch (_) {
            // Игнорируем ошибки парсинга
          }
        }
        if (dateTime != null) {
          formattedDate = DateFormat('dd.MM.yyyy', 'ru').format(dateTime);
        }
      } catch (_) {
        // Используем дату как есть, если не удалось распарсить
        formattedDate = news.date;
      }
    }

    // Формируем текст для шаринга
    final buffer = StringBuffer();
    buffer.writeln('📰 ${news.title}');
    buffer.writeln('');

    // Добавляем подзаголовок, если есть
    if (news.subTitle.isNotEmpty) {
      buffer.writeln(news.subTitle);
      buffer.writeln('');
    }

    // Добавляем краткое описание (первые 200 символов body)
    if (news.body.isNotEmpty) {
      final description = news.body.length > 200 ? '${news.body.substring(0, 200)}...' : news.body;
      buffer.writeln(description);
      buffer.writeln('');
    }

    // Добавляем источник, если есть
    if (news.source.isNotEmpty) {
      buffer.writeln('📌 Источник: ${news.source}');
    }

    // Добавляем дату, если есть
    if (formattedDate != null && formattedDate.isNotEmpty) {
      buffer.writeln('📅 Дата: $formattedDate');
    }

    // Добавляем информацию о важности новости
    if (news.isBigNews) {
      buffer.writeln('⭐ Важная новость');
    }

    buffer.writeln('');
    buffer.writeln('🔗 $newsUrl');
    buffer.writeln('');
    buffer.writeln('Читайте полную новость в AviaPoint');

    final shareText = buffer.toString();

    // Если есть обложка, делимся с изображением
    if (news.pictureBig.isNotEmpty) {
      _shareNewsWithImage(context, news.pictureBig, shareText);
    } else {
      Share.share(shareText);
    }
  }

  /// Поделиться новостью с изображением обложки
  Future<void> _shareNewsWithImage(BuildContext context, String imageUrl, String text) async {
    try {
      if (kIsWeb) {
        // На вебе просто делимся текстом и ссылкой на изображение
        final fullImageUrl = getImageUrl(imageUrl);
        Share.share('$text\n\n🖼️ Обложка: $fullImageUrl');
        return;
      }

      // На мобильных платформах скачиваем изображение и делимся файлом
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16),
              Text('Подготовка к отправке...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final fullImageUrl = getImageUrl(imageUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = imageUrl.split('/').last.split('?').first;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(fullImageUrl, filePath);

      if (context.mounted) {
        scaffoldMessenger.hideCurrentSnackBar();
        await Share.shareXFiles([XFile(filePath)], text: text);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться с изображением: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        // В случае ошибки делимся только текстом
        Share.share(text);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _currentNews = widget.news;
    // Загружаем полные данные новости (включая при открытии по ссылке только по id)
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
          debugPrint(
            '✅ [DetailNewsScreen] Загружена новость ID: ${news.id}, additionalImages: ${news.additionalImages?.length ?? 0}',
          );
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
    if (news == null) return;
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
    if (news == null) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Новости авиации', withBack: true),
        body: Center(child: LoadingCustom()),
      );
    }
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
            IconButton(icon: const Icon(Icons.share), onPressed: _shareNews, tooltip: 'Поделиться'),
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
                        final allImages = <String?>[news.pictureBig, ...(news.additionalImages ?? [])];
                        PhotoViewer.show(context, allImages, initialIndex: 0);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                        child: NetworkImageWidget(imageUrl: getImageUrl(news.pictureBig), fit: BoxFit.fill),
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
                        Text(news.subTitle, style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
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
                              Text(
                                formatNewsDate(news.date),
                                style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF)),
                              ),
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
                                  final allImages = <String?>[news.pictureBig, ...(news.additionalImages ?? [])];
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
                                    child: NetworkImageWidget(
                                      imageUrl: getImageUrl(imageUrl),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
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
                            style: AppStyles.medium10s.copyWith(
                              color: Color(0xFF0A6EFA),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF0A6EFA),
                            ),
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

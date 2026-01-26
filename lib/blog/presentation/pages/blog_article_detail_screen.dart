import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_article_detail_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/core/utils/seo_helper.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';
import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_comments_bloc.dart';
import 'package:aviapoint/blog/presentation/widgets/comment_card.dart';
import 'package:aviapoint/blog/presentation/widgets/comment_dialog.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/blog/domain/entities/blog_comment_entity.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';

@RoutePage()
class BlogArticleDetailScreen extends StatefulWidget {
  final int articleId;

  const BlogArticleDetailScreen({super.key, @PathParam('id') required this.articleId});

  @override
  State<BlogArticleDetailScreen> createState() => _BlogArticleDetailScreenState();
}

class _BlogArticleDetailScreenState extends State<BlogArticleDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogArticleDetailBloc>().add(GetBlogArticleByIdEvent(id: widget.articleId));
  }

  void _shareArticle(String title) {
    Share.share('$title\n\nЧитайте в АвиаБлоге');
  }

  String _getAuthorName() {
    return context.read<BlogArticleDetailBloc>().state.maybeWhen(
      success: (article) {
        if (article.author == null) return 'Автор';
        final firstName = article.author!.firstName ?? '';
        final lastName = article.author!.lastName ?? '';
        if (firstName.isEmpty && lastName.isEmpty) {
          return article.author!.phone;
        }
        return '$firstName $lastName'.trim();
      },
      orElse: () => 'Автор',
    );
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'published':
        return 'Опубликовано';
      case 'draft':
        return 'Черновик';
      case 'archived':
        return 'Архив';
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'published':
        return const Color(0xFF10B981); // Зеленый
      case 'draft':
        return const Color(0xFFF59E0B); // Оранжевый
      case 'archived':
        return const Color(0xFF9CA5AF); // Серый
      default:
        return const Color(0xFFF59E0B);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && mounted) {
          // Обновляем список статей при возврате назад (для системного жеста "назад")
          // BlogArticlesBloc глобальный, поэтому обновление сработает даже если контекст unmounted
          try {
            context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));
          } catch (e) {
            debugPrint('⚠️ Ошибка обновления списка статей при возврате: $e');
          }
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'АвиаБлог',
          withBack: true,
          onTap: () {
            // Обновляем список статей перед возвратом
            _refreshArticlesList();
            AutoRouter.of(context).pop();
          },
          actions: [
            BlocBuilder<BlogArticleDetailBloc, BlogArticleDetailState>(
              builder: (context, state) {
                final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

                return state.maybeWhen(
                  success: (article) {
                    final isAuthor = isAuthenticated && PermissionHelper.isOwnerOrAdmin(article.authorId, context);
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isAuthor)
                          IconButton(
                            iconSize: 28.sp,
                            icon: const Icon(Icons.edit),
                            onPressed: () => AutoRouter.of(context).push(EditBlogArticleRoute(articleId: article.id)),
                            tooltip: 'Редактировать статью',
                          ),
                        IconButton(iconSize: 28.sp, icon: const Icon(Icons.share), onPressed: () => _shareArticle(article.title), tooltip: 'Поделиться'),
                      ],
                    );
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.background,
        body: BlocBuilder<BlogArticleDetailBloc, BlogArticleDetailState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => LoadingCustom(paddingTop: 200.h),
            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
              textError: errorForUser,
              repeat: () {
                context.read<BlogArticleDetailBloc>().add(GetBlogArticleByIdEvent(id: widget.articleId));
              },
            ),
            success: (article) {
              // Устанавливаем SEO метатеги
              WidgetsBinding.instance.addPostFrameCallback((_) {
                SeoHelper.setBlogArticleMetaTags(
                  title: article.title,
                  description: article.excerpt ?? article.title,
                  imageUrl: article.coverImageUrl,
                  articleId: article.id,
                  publishedAt: article.publishedAt,
                );
              });

              final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
              final isAuthor = isAuthenticated && PermissionHelper.isOwnerOrAdmin(article.authorId, context);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty)
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: getImageUrl(article.coverImageUrl!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 250,
                            placeholder: (context, url) => Shimmer(
                              duration: const Duration(milliseconds: 1000),
                              color: const Color(0xFF8D66FE),
                              colorOpacity: 0.2,
                              child: Container(decoration: const BoxDecoration()),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 250,
                              color: const Color(0xFFD9E6F8),
                              child: Icon(Icons.image, size: 48.sp),
                            ),
                          ),
                          // Чипс со статусом для автора в правом верхнем углу
                          if (isAuthor)
                            Positioned(
                              top: 16,
                              right: 8,
                              child: StatusChip(
                                text: _getStatusText(article.status),
                                backgroundColor: _getStatusColor(article.status),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                borderRadius: 8,
                              ),
                            ),
                        ],
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title, style: AppStyles.bold20s.copyWith(color: const Color(0xFF374151))),
                          if (article.excerpt != null && article.excerpt!.isNotEmpty) ...[
                            SizedBox(height: 12.h),
                            Text(article.excerpt!, style: AppStyles.regular14s.copyWith(color: const Color(0xFF6B7280))),
                          ],
                          SizedBox(height: 12.h),
                          Wrap(
                            spacing: 16.w,
                            runSpacing: 8.h,
                            children: [
                              if (article.author != null)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.person_outline, size: 14.sp, color: const Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Text(_getAuthorName(), style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF))),
                                  ],
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.calendar_today, size: 14.sp, color: const Color(0xFF9CA5AF)),
                                  SizedBox(width: 4.w),
                                  Text(article.publishedAt != null ? formatDate(DateTime.parse(article.publishedAt!)) : '', style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF))),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.visibility_outlined, size: 14.sp, color: const Color(0xFF9CA5AF)),
                                  SizedBox(width: 4.w),
                                  Text('${article.viewCount}', style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF))),
                                ],
                              ),
                              if (article.aircraftModel != null)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.flight, size: 14.sp, color: const Color(0xFF9CA5AF)),
                                    SizedBox(width: 4.w),
                                    Flexible(
                                      child: Text(
                                        article.aircraftModel!.getFullName(),
                                        style: AppStyles.light12s.copyWith(color: const Color(0xFF9CA5AF)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          if (article.category != null) ...[
                            SizedBox(height: 8.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: article.category!.color != null && article.category!.color!.isNotEmpty
                                    ? (() {
                                        try {
                                          return Color(int.parse(article.category!.color!.replaceFirst('#', '0xFF')));
                                        } catch (e) {
                                          return AppColors.primary100p;
                                        }
                                      })()
                                    : AppColors.primary100p,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(article.category!.name, style: AppStyles.regular12s.copyWith(color: Colors.white)),
                            ),
                          ],

                          SizedBox(height: 16),
                          _buildArticleContent(article.content),
                          SizedBox(height: 16),
                          _buildCommentsSection(article.id),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }

  /// Обновляет список статей на предыдущем экране (BlogScreen)
  /// BlogScreen сам применит свои фильтры при необходимости
  void _refreshArticlesList() {
    try {
      // Обновляем список статей через BlogArticlesBloc
      // BlogScreen сам применяет свои фильтры через _applyFilters при необходимости
      context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));
    } catch (e) {
      debugPrint('⚠️ Ошибка обновления списка статей: $e');
    }
  }

  /// Отображает содержимое статьи через QuillEditor в read-only режиме
  /// Нормализует URL изображений для работы с разными окружениями (dev/prod)
  Widget _buildArticleContent(String content) {
    if (content.isEmpty) {
      return const SizedBox();
    }

    try {
      // Парсим JSON Delta в Document
      final jsonContent = jsonDecode(content);

      // Нормализуем URL изображений: преобразуем абсолютные URL в относительные пути
      // и обратно, чтобы они работали в любом окружении
      final normalizedContent = _normalizeImageUrls(jsonContent);

      final document = Document.fromJson(normalizedContent);

      return _QuillReadOnlyViewer(document: document);
    } catch (e) {
      // Если ошибка парсинга - показываем сообщение об ошибке
      debugPrint('❌ Ошибка парсинга JSON Delta: $e');
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Text('Ошибка загрузки содержимого статьи', style: AppStyles.regular14s.copyWith(color: Colors.red)),
      );
    }
  }

  /// Нормализует URL изображений в JSON Delta для работы с разными окружениями
  /// Преобразует абсолютные URL (localhost/production) в относительные пути,
  /// а затем обратно в абсолютные URL для текущего окружения
  List<dynamic> _normalizeImageUrls(List<dynamic> operations) {
    return operations.map((op) {
      if (op is Map<String, dynamic>) {
        final insert = op['insert'];

        // Если это изображение
        if (insert is Map<String, dynamic> && insert.containsKey('image')) {
          final imageUrl = insert['image'] as String;

          // Извлекаем относительный путь из URL
          String relativePath = imageUrl;

          // Если это абсолютный URL, извлекаем путь
          if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
            try {
              final uri = Uri.parse(imageUrl);
              // Убираем /public/ если есть (production)
              var path = uri.path;
              if (path.startsWith('/public/')) {
                path = path.substring('/public/'.length);
              } else if (path.startsWith('/')) {
                path = path.substring(1);
              }
              relativePath = path;
            } catch (e) {
              debugPrint('⚠️ Ошибка парсинга URL изображения: $imageUrl, $e');
              // Оставляем как есть
            }
          }

          // Преобразуем относительный путь в полный URL для текущего окружения
          final normalizedUrl = relativePath.startsWith('http://') || relativePath.startsWith('https://') ? relativePath : getImageUrl(relativePath);

          return {
            ...op,
            'insert': {'image': normalizedUrl},
          };
        }
      }
      return op;
    }).toList();
  }

  /// Секция комментариев
  Widget _buildCommentsSection(int articleId) {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    return BlocProvider(
      create: (context) {
        final bloc = BlogCommentsBloc(blogRepository: getIt<BlogRepository>());
        bloc.add(GetCommentsByArticleIdEvent(articleId: articleId));
        return bloc;
      },
      child: BlocBuilder<BlogCommentsBloc, BlogCommentsState>(
        builder: (context, commentsState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Комментарии', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
              SizedBox(height: 12),
              // Кнопка "Оставить комментарий"
              ElevatedButton.icon(
                onPressed: () => _showCommentDialog(context, articleId, isAuthenticated),
                icon: Icon(Icons.comment_outlined, size: 16.sp),
                label: Text('Оставить комментарий', style: AppStyles.bold16s),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A6EFA),
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                ),
              ),
              SizedBox(height: 12.h),
              commentsState.maybeWhen(
                loading: () => Center(
                  child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                ),
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  ),
                ),
                success: (comments) {
                  if (comments.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.comment_outlined, size: 48, color: Color(0xFF9CA5AF)),
                            SizedBox(height: 12.h),
                            Text('Пока нет комментариев', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ),
                      ),
                    );
                  }

                  // Разделяем комментарии: основные и ответы
                  final mainComments = comments.where((c) => c.parentCommentId == null).toList();
                  final replies = comments.where((c) => c.parentCommentId != null).toList();

                  // Получаем текущего пользователя для проверки прав
                  final profileState = context.read<ProfileBloc>().state;
                  final currentUserId = profileState.maybeWhen(success: (profile) => profile.id, orElse: () => null);

                  return Column(
                    children: mainComments.map((BlogCommentEntity comment) {
                      final commentReplies = replies.where((BlogCommentEntity r) => r.parentCommentId == comment.id).toList();
                      final isAdmin = PermissionHelper.isAdmin(context);
                      final canDelete = (currentUserId != null && comment.authorId == currentUserId) || isAdmin;
                      final canEdit = (currentUserId != null && comment.authorId == currentUserId) || isAdmin;
                      final canReply = isAuthenticated && currentUserId != null && currentUserId != comment.authorId;

                      return Column(
                        children: [
                          CommentCard(
                            comment: comment,
                            isReply: false,
                            canDelete: canDelete,
                            canEdit: canEdit,
                            onDelete: canDelete ? () => _showDeleteCommentDialog(context, articleId, comment.id) : null,
                            onEdit: canEdit ? () => _showEditCommentDialog(context, articleId, comment, isAuthenticated) : null,
                            onReply: canReply ? () => _showCommentDialog(context, articleId, isAuthenticated, parentCommentId: comment.id.toString()) : null,
                          ),
                          // Отображаем ответы на комментарий (если они есть)
                          if (commentReplies.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Column(
                                children: commentReplies.map((BlogCommentEntity reply) {
                                  final isAdmin = PermissionHelper.isAdmin(context);
                                  final canDeleteReply = (currentUserId != null && reply.authorId == currentUserId) || isAdmin;
                                  final canEditReply = (currentUserId != null && reply.authorId == currentUserId) || isAdmin;
                                  return CommentCard(
                                    comment: reply,
                                    isReply: true,
                                    canDelete: canDeleteReply,
                                    canEdit: canEditReply,
                                    onDelete: canDeleteReply ? () => _showDeleteCommentDialog(context, articleId, reply.id) : null,
                                    onEdit: canEditReply ? () => _showEditCommentDialog(context, articleId, reply, isAuthenticated) : null,
                                  );
                                }).toList(),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  );
                },
                orElse: () => const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Показывает диалог для создания/редактирования комментария
  Future<void> _showCommentDialog(BuildContext context, int articleId, bool isAuthenticated, {String? parentCommentId}) async {
    if (!isAuthenticated) {
      // Если не авторизован, показываем авторизацию
      await showLogin(
        context,
        callback: () {
          // После успешной авторизации проверяем снова и показываем диалог
          final appState = Provider.of<AppState>(context, listen: false);
          if (appState.isAuthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                _showCommentDialog(context, articleId, true, parentCommentId: parentCommentId);
              }
            });
          }
        },
      );
      return;
    }

    // Показываем диалог создания комментария
    final commentsBloc = context.read<BlogCommentsBloc>();
    await showCommentDialog(
      context: context,
      articleId: articleId,
      parentCommentId: parentCommentId,
      commentsBloc: commentsBloc,
      onCommentCreated: () {
        commentsBloc.add(GetCommentsByArticleIdEvent(articleId: articleId));
      },
    );
  }

  /// Показывает диалог для редактирования комментария
  Future<void> _showEditCommentDialog(BuildContext context, int articleId, BlogCommentEntity comment, bool isAuthenticated) async {
    if (!isAuthenticated) {
      return;
    }

    final commentsBloc = context.read<BlogCommentsBloc>();
    await showCommentDialog(
      context: context,
      articleId: articleId,
      comment: comment,
      commentsBloc: commentsBloc,
      onCommentCreated: () {
        commentsBloc.add(GetCommentsByArticleIdEvent(articleId: articleId));
      },
    );
  }

  /// Показывает диалог подтверждения удаления комментария
  Future<void> _showDeleteCommentDialog(BuildContext context, int articleId, int commentId) async {
    if (!mounted) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Удалить комментарий?'),
        content: Text('Вы уверены, что хотите удалить этот комментарий?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Удалить', style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );

    if (result == true && mounted) {
      final commentsBloc = context.read<BlogCommentsBloc>();
      commentsBloc.add(DeleteCommentEvent(articleId: articleId, commentId: commentId));
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
    // QuillEditor в read-only режиме
    // Блокируем редактирование через focusNode (canRequestFocus: false, skipTraversal: true)
    // QuillEditor сам управляет прокруткой для длинного контента
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: QuillEditor.basic(
        controller: _controller,
        config: QuillEditorConfig(placeholder: '', padding: EdgeInsets.zero, embedBuilders: kIsWeb ? FlutterQuillEmbeds.editorWebBuilders() : FlutterQuillEmbeds.editorBuilders()),
        focusNode: _focusNode,
      ),
    );
  }
}

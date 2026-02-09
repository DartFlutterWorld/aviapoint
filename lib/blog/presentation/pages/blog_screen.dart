import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_categories_bloc.dart';
import 'package:aviapoint/blog/presentation/widgets/big_blog_article_widget.dart';
import 'package:aviapoint/blog/presentation/widgets/blog_category_chip.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int? _selectedCategoryId;
  int? _selectedAircraftModelId;
  String? _selectedAircraftModelName;
  int? _selectedAuthorId;
  bool _showMyArticles = false;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
    context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      _applyFilters();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      final state = context.read<BlogArticlesBloc>().state;
      state.maybeWhen(
        success: (articles, hasMore) {
          if (hasMore) {
            context.read<BlogArticlesBloc>().add(const LoadMoreBlogArticlesEvent());
          }
        },
        orElse: () {},
      );
    }
  }

  void _onCategorySelected(BlogCategoryEntity category) {
    setState(() {
      _selectedCategoryId = category.id;
    });
    _applyFilters();
  }

  void _onCategoryDeselected() {
    setState(() {
      _selectedCategoryId = null;
    });
    _applyFilters();
  }

  void _applyFilters() {
    final searchQuery = _searchController.text.trim().isEmpty ? null : _searchController.text.trim();
    context.read<BlogArticlesBloc>().add(
      GetBlogArticlesEvent(
        categoryId: _selectedCategoryId,
        aircraftModelId: _selectedAircraftModelId,
        authorId: _selectedAuthorId,
        status: _showMyArticles ? null : 'published', // Для своих статей показываем все статусы
        search: searchQuery,
      ),
    );
  }

  Future<void> _toggleMyArticles() async {
    if (_showMyArticles) {
      // Выключаем фильтр "мои статьи"
      setState(() {
        _showMyArticles = false;
        _selectedAuthorId = null;
      });
      _applyFilters();
    } else {
      // Включаем фильтр "мои статьи"
      // Получаем ID текущего пользователя из ProfileBloc
      final profileBloc = context.read<ProfileBloc>();
      final profileState = profileBloc.state;

      int? userId;
      profileState.maybeWhen(
        success: (profile) {
          userId = profile.id;
        },
        orElse: () {
          // Если профиль не загружен, загружаем его
          profileBloc.add(const GetProfileEvent());
        },
      );

      // Если ID не получен, ждем загрузки профиля
      if (userId == null) {
        // Показываем индикатор загрузки
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Загрузка данных профиля...'), duration: Duration(seconds: 2)));
        }

        // Ждем загрузки профиля (максимум 5 секунд)
        try {
          await profileBloc.stream
              .firstWhere((state) {
                return state.maybeWhen(
                  success: (_) => true,
                  error: (_, __, ___, ____, _____) => true,
                  orElse: () => false,
                );
              })
              .timeout(const Duration(seconds: 5));

          final newState = profileBloc.state;
          newState.maybeWhen(
            success: (profile) {
              userId = profile.id;
            },
            orElse: () {
              userId = null;
            },
          );
        } catch (e) {
          userId = null;
        }
      }

      if (userId != null && mounted) {
        setState(() {
          _showMyArticles = true;
          _selectedAuthorId = userId;
        });
        _applyFilters();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Не удалось загрузить данные профиля'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _showAircraftFilter() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AircraftTypeSelectorDialog(initialValue: _selectedAircraftModelName, returnModelId: true),
    );

    if (result != null) {
      setState(() {
        _selectedAircraftModelId = result['id'] as int?;
        _selectedAircraftModelName = result['fullName'] as String?;
      });
      _applyFilters();
    } else if (result == null && _selectedAircraftModelId != null) {
      // Если диалог закрыт без выбора, но был выбран самолёт, очищаем фильтр
      setState(() {
        _selectedAircraftModelId = null;
        _selectedAircraftModelName = null;
      });
      _applyFilters();
    }
  }

  void _clearAircraftFilter() {
    setState(() {
      _selectedAircraftModelId = null;
      _selectedAircraftModelName = null;
    });
    _applyFilters();
  }

  void _clearSearch() {
    _searchController.clear();
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final isAuthenticated = appState.isAuthenticated;

        return BlocListener<BlogArticlesBloc, BlogArticlesState>(
          listener: (context, state) {
            // Обновляем список статей после удаления
            state.maybeWhen(
              deleted: () {
                // Обновляем список статей с текущими фильтрами
                _applyFilters();
              },
              orElse: () {},
            );
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            floatingActionButton: FloatingActionButtonWidget(
              title: 'Сделать\nзапись',
              onTap: () async {
                final appState = Provider.of<AppState>(context, listen: false);
                // Если не авторизован, показываем авторизацию
                if (!appState.isAuthenticated) {
                  final result = await showLogin(context);

                  // После успешной авторизации обновляем статус и переходим на создание статьи
                  if (result == true && context.mounted) {
                    await appState.checkAuthStatus();
                    if (appState.isAuthenticated && context.mounted) {
                      AutoRouter.of(context).push(const CreateBlogArticleRoute());
                    }
                  }
                } else {
                  // Если авторизован, сразу переходим на создание статьи
                  AutoRouter.of(context).push(const CreateBlogArticleRoute());
                }
              },
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
                _applyFilters();
              },
              child: ListView(
                controller: _scrollController,
                children: [
                  SizedBox(height: 8),
                  // Поиск и фильтры
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        // Поле поиска (по высоте как поиск по самолёту в маркете)
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Поиск по записям...',
                            prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA5AF), size: 18.0),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear, color: Color(0xFF9CA5AF), size: 18.0),
                                    onPressed: _clearSearch,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  )
                                : null,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF0A6EFA), width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            isDense: true,
                          ),
                          style: AppStyles.regular12s,
                        ),
                        SizedBox(height: 8),
                        // Фильтр по самолётам и кнопка "Мои статьи"
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _showAircraftFilter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xFFD9E6F8)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.flight, color: const Color(0xFF9CA5AF), size: 16),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _selectedAircraftModelName ?? 'Фильтр по самолёту',
                                          style: AppStyles.regular12s.copyWith(
                                            color: _selectedAircraftModelName != null
                                                ? const Color(0xFF374151)
                                                : const Color(0xFF9CA5AF),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down, color: const Color(0xFF9CA5AF), size: 20.0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_selectedAircraftModelId != null) ...[
                              SizedBox(width: 8),
                              SizedBox(
                                // height: 36,
                                width: 36,
                                child: IconButton(
                                  icon: Icon(Icons.clear, color: const Color(0xFF9CA5AF), size: 18.0),
                                  onPressed: _clearAircraftFilter,
                                  tooltip: 'Очистить фильтр',
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ),
                            ],
                            if (isAuthenticated) ...[
                              SizedBox(width: 8),
                              OutlinedButton.icon(
                                onPressed: _toggleMyArticles,
                                icon: Icon(
                                  _showMyArticles ? Icons.check_circle : Icons.person_outline,
                                  size: 16.0,
                                  color: _showMyArticles ? Colors.white : const Color(0xFF0A6EFA),
                                ),
                                label: Text(
                                  'Мои',
                                  style: AppStyles.bold16s.copyWith(
                                    color: _showMyArticles ? Colors.white : const Color(0xFF0A6EFA),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  minimumSize: Size(0, 0),
                                  backgroundColor: _showMyArticles ? const Color(0xFF0A6EFA) : Colors.white,
                                  side: BorderSide(
                                    color: _showMyArticles ? const Color(0xFF0A6EFA) : const Color(0xFF0A6EFA),
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  BlocBuilder<BlogCategoriesBloc, BlogCategoriesState>(
                    builder: (context, state) => state.maybeWhen(
                      loading: () => const SizedBox(),
                      error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                        textError: errorForUser,
                        repeat: () {
                          context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
                        },
                      ),
                      success: (categories) => _CategoryList(
                        categories: categories,
                        selectedCategoryId: _selectedCategoryId,
                        onCategorySelected: _onCategorySelected,
                        onCategoryDeselected: _onCategoryDeselected,
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                  SizedBox(height: 12),
                  BlocBuilder<BlogArticlesBloc, BlogArticlesState>(
                    builder: (context, state) => state.maybeWhen(
                      loading: () => LoadingCustom(paddingTop: 200),
                      error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                        textError: errorForUser,
                        repeat: () {
                          final searchQuery = _searchController.text.trim().isEmpty
                              ? null
                              : _searchController.text.trim();
                          context.read<BlogArticlesBloc>().add(
                            GetBlogArticlesEvent(
                              categoryId: _selectedCategoryId,
                              aircraftModelId: _selectedAircraftModelId,
                              status: 'published',
                              search: searchQuery,
                            ),
                          );
                        },
                      ),
                      loadingMore: (articles) =>
                          _ArticleList(articles: articles, isLoadingMore: true, showStatus: _showMyArticles),
                      success: (articles, hasMore) => _ArticleList(
                        articles: articles,
                        isLoadingMore: false,
                        hasMore: hasMore,
                        showStatus: _showMyArticles,
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CategoryList extends StatefulWidget {
  final List<BlogCategoryEntity> categories;
  final int? selectedCategoryId;
  final void Function(BlogCategoryEntity) onCategorySelected;
  final VoidCallback onCategoryDeselected;

  const _CategoryList({
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.onCategoryDeselected,
  });

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<_CategoryList> {
  late final ScrollController _scrollController;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, top: 8, bottom: 12),
      child: GestureDetector(
        onPanStart: (_) {
          setState(() {
            _isDragging = true;
          });
        },
        onPanUpdate: (details) {
          if (_scrollController.hasClients) {
            _scrollController.position.moveTo(
              (_scrollController.position.pixels - details.delta.dx).clamp(
                0.0,
                _scrollController.position.maxScrollExtent,
              ),
            );
          }
        },
        onPanEnd: (_) {
          setState(() {
            _isDragging = false;
          });
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.only(left: 8),
          scrollDirection: Axis.horizontal,
          physics: _isDragging ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.categories.map((category) {
              final isSelected = widget.selectedCategoryId == category.id;
              return BlogCategoryChip(
                category: category,
                isSelected: isSelected,
                onTap: _isDragging
                    ? () {}
                    : () {
                        if (isSelected) {
                          widget.onCategoryDeselected();
                        } else {
                          widget.onCategorySelected(category);
                        }
                      },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ArticleList extends StatelessWidget {
  final List<BlogArticleEntity> articles;
  final bool isLoadingMore;
  final bool hasMore;
  final bool showStatus;

  const _ArticleList({
    required this.articles,
    this.isLoadingMore = false,
    this.hasMore = false,
    this.showStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    // Сортируем статьи: сначала по опубликованной дате, затем по дате создания (новые сверху)
    final sortedArticles = [...articles]
      ..sort(
        (a, b) => _parseBlogDateTime(
          b.publishedAt ?? b.createdAt,
        ).compareTo(_parseBlogDateTime(a.publishedAt ?? a.createdAt)),
      );

    if (sortedArticles.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text('Статьи не найдены', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
        ),
      );
    }

    // Hero + Grid (2 колонки) - одинаково для всех платформ, как в новостях
    return LayoutBuilder(
      builder: (context, constraints) {
        // Используем реальную доступную ширину контента
        final availableWidth = constraints.maxWidth;
        final padding = 0.0;
        final spacing = 16.0;
        final contentWidth = availableWidth - padding * 2;

        final heroWidth = contentWidth;
        final gridItemWidth = (contentWidth - spacing) / 2;

        // Первая статья - Hero (на всю ширину)
        final heroArticle = sortedArticles.first;
        final remainingArticles = sortedArticles.skip(1).toList();

        return Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero статья (большая, на всю ширину)
              SizedBox(height: 12),
              SizedBox(
                width: heroWidth,
                child: GestureDetector(
                  onTap: () => AutoRouter.of(context).push(BlogArticleDetailRoute(articleId: heroArticle.id)),
                  child: BigBlogArticleWidget(article: heroArticle, showStatus: showStatus),
                ),
              ),
              if (remainingArticles.isNotEmpty) ...[
                SizedBox(height: spacing),
                // Остальные статьи в сетке 2 колонки
                Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: remainingArticles.map((article) {
                    return SizedBox(
                      width: gridItemWidth,
                      child: GestureDetector(
                        onTap: () => AutoRouter.of(context).push(BlogArticleDetailRoute(articleId: article.id)),
                        child: BigBlogArticleWidget(article: article, showStatus: showStatus),
                      ),
                    );
                  }).toList(),
                ),
              ],
              if (isLoadingMore) Padding(padding: EdgeInsets.all(16), child: const CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}

/// Парсим дату/время статьи для сортировки.
/// Поддерживаем ISO-строки и формат `yyyy-MM-dd` / `yyyy-MM-ddTHH:mm:ss`.
DateTime _parseBlogDateTime(String? value) {
  if (value == null || value.isEmpty) {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  // Пробуем стандартный DateTime.parse (ISO и близкие форматы)
  final iso = DateTime.tryParse(value);
  if (iso != null) return iso;

  // Fallback – самая старая дата, чтобы некорректные значения оказывались внизу
  return DateTime.fromMillisecondsSinceEpoch(0);
}

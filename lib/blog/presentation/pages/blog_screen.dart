import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_categories_bloc.dart';
import 'package:aviapoint/blog/presentation/widgets/blog_article_card.dart';
import 'package:aviapoint/blog/presentation/widgets/blog_category_chip.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

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
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

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
        appBar: CustomAppBar(
          title: 'АвиаБлог',
          withBack: true,
          withProfile: true,
          actions: isAuthenticated
              ? [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => AutoRouter.of(context).push(const CreateBlogArticleRoute()),
                    tooltip: 'Создать статью',
                  ),
                ]
              : const [],
        ),
        backgroundColor: AppColors.background,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0A6EFA), Color(0xFF7A0FD9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0A6EFA).withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                final appState = Provider.of<AppState>(context, listen: false);
                // Если не авторизован, показываем авторизацию
                if (!appState.isAuthenticated) {
                  final result = await showCupertinoModalBottomSheet<bool>(
                    barrierColor: Colors.black12,
                    topRadius: const Radius.circular(20),
                    context: context,
                    builder: (context) => PhoneAuthScreen(),
                  );

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
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                    ),
                    SizedBox(width: 12.w),
                    Text('Создать статью', style: AppStyles.bold14s.copyWith(color: Colors.white, letterSpacing: 0.5)),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
            _applyFilters();
          },
          child: ListView(
            controller: _scrollController,
            children: [
              SizedBox(height: 8.h),
              // Поиск и фильтры
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    // Поле поиска
                    SizedBox(
                      height: 36.h,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Поиск по статьям...',
                          prefixIcon: Icon(Icons.search, color: const Color(0xFF9CA5AF), size: 18.sp),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(Icons.clear, color: const Color(0xFF9CA5AF), size: 18.sp),
                                  onPressed: _clearSearch,
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                )
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: const Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: const Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: const Color(0xFF0A6EFA), width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
                          isDense: true,
                        ),
                        style: AppStyles.regular12s,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Фильтр по самолётам и кнопка "Мои статьи"
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _showAircraftFilter,
                            child: Container(
                              height: 36.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFD9E6F8)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.flight, color: const Color(0xFF9CA5AF), size: 16.sp),
                                  SizedBox(width: 8.w),
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
                                  Icon(Icons.arrow_drop_down, color: const Color(0xFF9CA5AF), size: 20.sp),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_selectedAircraftModelId != null) ...[
                          SizedBox(width: 8.w),
                          SizedBox(
                            height: 36.h,
                            width: 36.w,
                            child: IconButton(
                              icon: Icon(Icons.clear, color: const Color(0xFF9CA5AF), size: 18.sp),
                              onPressed: _clearAircraftFilter,
                              tooltip: 'Очистить фильтр',
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                        ],
                        if (isAuthenticated) ...[
                          SizedBox(width: 8.w),
                          OutlinedButton.icon(
                            onPressed: _toggleMyArticles,
                            icon: Icon(
                              _showMyArticles ? Icons.check_circle : Icons.person_outline,
                              size: 16.sp,
                              color: _showMyArticles ? Colors.white : const Color(0xFF0A6EFA),
                            ),
                            label: Text(
                              'Мои',
                              style: AppStyles.regular12s.copyWith(
                                color: _showMyArticles ? Colors.white : const Color(0xFF0A6EFA),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              minimumSize: Size(0, 36.h),
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
              SizedBox(height: 8.h),
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
              SizedBox(height: 12.h),
              BlocBuilder<BlogArticlesBloc, BlogArticlesState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                    textError: errorForUser,
                    repeat: () {
                      final searchQuery = _searchController.text.trim().isEmpty ? null : _searchController.text.trim();
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
  }
}

class _CategoryList extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: SizedBox(
        height: 25.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = selectedCategoryId == category.id;
            return BlogCategoryChip(
              category: category,
              isSelected: isSelected,
              onTap: () {
                if (isSelected) {
                  onCategoryDeselected();
                } else {
                  onCategorySelected(category);
                }
              },
            );
          },
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
    if (articles.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32.w),
        child: Center(
          child: Text('Статьи не найдены', style: TextStyle(color: AppColors.textSecondary)),
        ),
      );
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return GestureDetector(
              onTap: () => AutoRouter.of(context).push(BlogArticleDetailRoute(articleId: article.id)),
              child: BlogArticleCard(article: article, showStatus: showStatus),
            );
          },
        ),
        if (isLoadingMore) Padding(padding: EdgeInsets.all(16.w), child: const CircularProgressIndicator()),
        if (!hasMore && articles.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text('Все статьи загружены', style: TextStyle(color: AppColors.textSecondary)),
          ),
      ],
    );
  }
}

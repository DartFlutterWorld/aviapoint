import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/news/presentation/widgets/big_news_widget.dart';
import 'package:aviapoint/news/presentation/widgets/small_news_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserNewsScreen extends StatefulWidget {
  const UserNewsScreen({super.key});

  @override
  State<UserNewsScreen> createState() => _UserNewsScreenState();
}

class _UserNewsScreenState extends State<UserNewsScreen> {
  String _selectedFilter = 'all'; // 'all', 'published', 'unpublished'

  @override
  void initState() {
    super.initState();
    _loadUserNews();
  }

  void _loadUserNews() {
    final profileState = context.read<ProfileBloc>().state;
    profileState.maybeWhen(
      success: (profile) {
        context.read<NewsBloc>().add(NewsEvent.getUserNews(userId: profile.id));
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    if (!isAuthenticated) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Мои новости', withBack: true),
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64, color: const Color(0xFF9CA5AF)),
              SizedBox(height: 16),
              Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: const Color(0xFF374151))),
              SizedBox(height: 8),
              Text(
                'Для просмотра ваших новостей необходимо войти в систему',
                style: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Мои новости', withBack: true),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Фильтр по статусу
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [_buildFilterChip('all', 'Все'), SizedBox(width: 8), _buildFilterChip('published', 'Опубликовано'), SizedBox(width: 8), _buildFilterChip('unpublished', 'Не опубликовано')],
            ),
          ),
          // Список новостей
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) => state.map(
                error: (state) => ErrorCustom(textError: state.errorForUser, repeat: _loadUserNews),
                loading: (state) => LoadingCustom(paddingTop: 200),
                success: (state) => _Success(news: state.news, filter: _selectedFilter),
                creating: (state) => LoadingCustom(paddingTop: 200),
                created: (state) => _Success(news: [state.news], filter: _selectedFilter),
                updating: (state) => LoadingCustom(paddingTop: 200),
                updated: (state) => _Success(news: [state.news], filter: _selectedFilter),
                deleting: (state) => LoadingCustom(paddingTop: 200),
                deleted: (state) => _Success(news: [], filter: _selectedFilter),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedFilter == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0A6EFA) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? const Color(0xFF0A6EFA) : const Color(0xFFD9E6F8), width: 1),
        ),
        child: Text(label, style: AppStyles.regular14s.copyWith(color: isSelected ? Colors.white : const Color(0xFF374151))),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<NewsEntity> news;
  final String filter;

  const _Success({required this.news, required this.filter});

  @override
  Widget build(BuildContext context) {
    // Фильтруем новости по выбранному статусу
    final filteredNews = filter == 'all'
        ? news
        : filter == 'published'
        ? news.where((n) => n.published).toList()
        : news.where((n) => !n.published).toList();

    // Сортируем новости по дате: последние размещённые сверху
    final sortedNews = [...filteredNews]..sort((a, b) => _parseNewsDate(b.date).compareTo(_parseNewsDate(a.date)));

    if (sortedNews.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.article_outlined, size: 64, color: const Color(0xFF9CA5AF)),
            SizedBox(height: 16),
            Text(
              filter == 'all'
                  ? 'У вас пока нет новостей'
                  : filter == 'published'
                  ? 'У вас нет опубликованных новостей'
                  : 'У вас нет неопубликованных новостей',
              style: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final padding = 0.0;
        final spacing = 16.0;
        final contentWidth = availableWidth - padding * 2;

        // На вебе используем Wrap для автоматического переноса
        if (kIsWeb) {
          final itemWidth = () {
            if (availableWidth >= 1200) return (contentWidth - spacing * 3) / 4;
            if (availableWidth >= 900) return (contentWidth - spacing * 2) / 3;
            if (availableWidth >= 600) return (contentWidth - spacing) / 2;
            return contentWidth;
          }();

          const itemHeight = 265.0;

          return Padding(
            padding: EdgeInsets.only(top: 16),
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: sortedNews.map((newsItem) {
                return SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context).push(DetailNewsRoute(news: newsItem, newsId: newsItem.id)),
                    child: Stack(
                      children: [
                        newsItem.isBigNews ? BigNewsWidget(news: newsItem) : SmallNewsWidget(news: newsItem),
                        // Статус в правом верхнем углу (как в детальной странице)
                        Positioned(
                          top: 16,
                          right: 16,
                          child: StatusChip(
                            text: newsItem.published ? 'Опубликовано' : 'Не опубликовано',
                            backgroundColor: newsItem.published ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            borderRadius: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          // На маленьких экранах - Grid (2 колонки)
          final gridItemWidth = (contentWidth - spacing) / 2;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: sortedNews.map((newsItem) {
                return SizedBox(
                  width: gridItemWidth,
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context).push(DetailNewsRoute(news: newsItem, newsId: newsItem.id)),
                    child: Stack(
                      children: [
                        newsItem.isBigNews ? BigNewsWidget(news: newsItem) : SmallNewsWidget(news: newsItem),
                        // Статус в правом верхнем углу (как в детальной странице)
                        Positioned(
                          top: 16,
                          right: 8,
                          child: StatusChip(
                            text: newsItem.published ? 'Опубликовано' : 'Не опубликовано',
                            backgroundColor: newsItem.published ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            borderRadius: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

/// Парсим строковую дату новости в [DateTime] для сортировки.
DateTime _parseNewsDate(String date) {
  final iso = DateTime.tryParse(date);
  if (iso != null) return iso;

  try {
    final datePart = date.split(' ').first;
    final parts = datePart.split('.');
    if (parts.length == 3) {
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day);
    }
  } catch (_) {}

  return DateTime.fromMillisecondsSinceEpoch(0);
}

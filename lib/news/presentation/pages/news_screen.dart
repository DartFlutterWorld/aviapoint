import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

@override
class _NewsScreenState extends State<NewsScreen> {
  bool _showMyNews = false;
  int? _selectedAuthorId;

  @override
  void initState() {
    super.initState();
    // Загружаем все новости при инициализации
    BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
  }

  void _refreshData() {
    // Обновляем новости в зависимости от состояния "Мои"
    if (_showMyNews && _selectedAuthorId != null) {
      // Показываем только новости пользователя
      BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: _selectedAuthorId));
    } else {
      // Показываем все новости
      BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
    }
  }

  Future<void> _toggleMyNews() async {
    if (_showMyNews) {
      // Выключаем фильтр "мои новости"
      setState(() {
        _showMyNews = false;
        _selectedAuthorId = null;
      });
      _refreshData();
    } else {
      // Включаем фильтр "мои новости"
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Загрузка данных профиля...'), duration: Duration(seconds: 2)));
        }

        // Ждем загрузки профиля (максимум 5 секунд)
        try {
          await profileBloc.stream
              .firstWhere((state) {
                return state.maybeWhen(success: (_) => true, error: (_, __, ___, ____, _____) => true, orElse: () => false);
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
          _showMyNews = true;
          _selectedAuthorId = userId;
        });
        // Загружаем новости пользователя
        BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: userId));
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось загрузить данные профиля'), backgroundColor: Colors.red));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Новости авиации', withBack: false, withProfile: true),
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButtonWidget(
        title: 'Предложить\nновость',
        onTap: () async {
          final appState = Provider.of<AppState>(context, listen: false);
          // Если не авторизован, показываем авторизацию
          if (!appState.isAuthenticated) {
            final result = await showCupertinoModalBottomSheet<bool>(barrierColor: Colors.black12, topRadius: const Radius.circular(20), context: context, builder: (context) => PhoneAuthScreen());

            // После успешной авторизации обновляем статус и переходим на создание новости
            if (result == true && context.mounted) {
              await appState.checkAuthStatus();
              if (appState.isAuthenticated && context.mounted) {
                await AutoRouter.of(context).push(const CreateNewsRoute());
                // После возврата с экрана создания обновляем данные
                _refreshData();
              }
            }
          } else {
            // Если авторизован, сразу переходим на создание новости
            await AutoRouter.of(context).push(const CreateNewsRoute());
            // После возврата с экрана создания обновляем данные
            if (mounted) {
              _refreshData();
            }
          }
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refreshData();
          // Ждем немного, чтобы показать индикатор обновления
          await Future<void>.delayed(const Duration(milliseconds: 500));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 8, right: 8, top: 12),
          children: [
            // Кнопка "Мои" (категории скрыты)
            if (Provider.of<AppState>(context, listen: true).isAuthenticated) ...[
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: OutlinedButton.icon(
                  onPressed: _toggleMyNews,
                  icon: Icon(_showMyNews ? Icons.check_circle : Icons.person_outline, size: 16, color: _showMyNews ? Colors.white : const Color(0xFF0A6EFA)),
                  label: Text('Мои', style: AppStyles.bold16s.copyWith(color: _showMyNews ? Colors.white : const Color(0xFF0A6EFA))),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: Size(0, 36),
                    backgroundColor: _showMyNews ? const Color(0xFF0A6EFA) : Colors.white,
                    side: BorderSide(color: _showMyNews ? const Color(0xFF0A6EFA) : const Color(0xFF0A6EFA)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],

            BlocListener<NewsBloc, NewsState>(
              listener: (context, state) {
                state.maybeWhen(
                  created: (news) {
                    // После создания новости переключаем на "Мои" если еще не включено
                    if (!_showMyNews && news.authorId != null) {
                      final profileBloc = context.read<ProfileBloc>();
                      final profileState = profileBloc.state;
                      int? userId;
                      profileState.maybeWhen(
                        success: (profile) {
                          userId = profile.id;
                        },
                        orElse: () {},
                      );

                      // Если ID совпадает с автором новости, переключаем на "Мои"
                      if (userId != null && userId == news.authorId) {
                        setState(() {
                          _showMyNews = true;
                          _selectedAuthorId = userId;
                        });
                        // Загружаем новости пользователя
                        BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: userId));
                      }
                    } else if (_showMyNews && _selectedAuthorId != null) {
                      // Если уже включено "Мои", просто обновляем список
                      BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: _selectedAuthorId));
                    }
                  },
                  updated: (news) {
                    // После обновления новости обновляем список
                    if (_showMyNews && _selectedAuthorId != null) {
                      BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: _selectedAuthorId));
                    } else {
                      BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
                    }
                  },
                  deleted: () {
                    // После удаления новости обновляем список
                    if (_showMyNews && _selectedAuthorId != null) {
                      BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: _selectedAuthorId));
                    } else {
                      BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
                    }
                  },
                  orElse: () {},
                );
              },
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) => state.map(
                  error: (state) => ErrorCustom(
                    textError: state.errorForUser,
                    repeat: () {
                      if (_showMyNews && _selectedAuthorId != null) {
                        BlocProvider.of<NewsBloc>(context).add(NewsEvent.get(authorId: _selectedAuthorId));
                      } else {
                        BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
                      }
                    },
                  ),
                  loading: (state) => LoadingCustom(paddingTop: 200),
                  success: (state) => _Success(news: state.news, showStatus: _showMyNews),
                  creating: (state) => LoadingCustom(paddingTop: 200),
                  created: (state) => _Success(news: [state.news], showStatus: _showMyNews),
                  updating: (state) => LoadingCustom(paddingTop: 200),
                  updated: (state) => _Success(news: [state.news], showStatus: _showMyNews),
                  deleting: (state) => LoadingCustom(paddingTop: 200),
                  deleted: (state) => _Success(news: [], showStatus: _showMyNews),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<NewsEntity> news;
  final bool showStatus;
  const _Success({required this.news, this.showStatus = false});

  @override
  Widget build(BuildContext context) {
    // Сортируем новости по дате: последние размещённые сверху
    final sortedNews = [...news]..sort((a, b) => _parseNewsDate(b.date).compareTo(_parseNewsDate(a.date)));

    return LayoutBuilder(
      builder: (context, constraints) {
        // Используем реальную доступную ширину контента
        final availableWidth = constraints.maxWidth;
        final padding = 0.0;
        final spacing = 16.0;
        final contentWidth = availableWidth - padding * 2;

        if (sortedNews.isEmpty) {
          return const SizedBox.shrink();
        }

        // На вебе используем Wrap для автоматического переноса
        if (kIsWeb) {
          // Вычисляем ширину для каждого элемента в зависимости от доступной ширины
          final itemWidth = () {
            if (availableWidth >= 1200) return (contentWidth - spacing * 3) / 4; // 4 колонки
            if (availableWidth >= 900) return (contentWidth - spacing * 2) / 3; // 3 колонки
            if (availableWidth >= 600) return (contentWidth - spacing) / 2; // 2 колонки
            return contentWidth; // 1 колонка
          }();

          // Фиксированная высота для элементов
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
                    child: newsItem.isBigNews ? BigNewsWidget(news: newsItem, showStatus: showStatus) : SmallNewsWidget(news: newsItem, showStatus: showStatus),
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          // На маленьких экранах - Hero + Grid (2 колонки)
          final heroWidth = contentWidth;
          final gridItemWidth = (contentWidth - spacing) / 2;

          // Первая новость - Hero (на всю ширину)
          final heroNews = sortedNews.first;
          final remainingNews = sortedNews.skip(1).toList();

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero новость (всегда большая, на всю ширину)
                SizedBox(height: 12),
                SizedBox(
                  width: heroWidth,
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context).push(DetailNewsRoute(news: heroNews, newsId: heroNews.id)),
                    child: BigNewsWidget(news: heroNews, showStatus: showStatus),
                  ),
                ),
                if (remainingNews.isNotEmpty) ...[
                  SizedBox(height: spacing),
                  // Остальные новости в сетке 2 колонки
                  Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: remainingNews.map((newsItem) {
                      return SizedBox(
                        width: gridItemWidth,
                        child: GestureDetector(
                          onTap: () => AutoRouter.of(context).push(DetailNewsRoute(news: newsItem, newsId: newsItem.id)),
                          child: newsItem.isBigNews ? BigNewsWidget(news: newsItem, showStatus: showStatus) : SmallNewsWidget(news: newsItem, showStatus: showStatus),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          );
        }
      },
    );
  }
}

/// Парсим строковую дату новости в [DateTime] для сортировки.
/// Поддерживаем ISO-формат и формат `dd.MM.yyyy` (с опциональным временем).
DateTime _parseNewsDate(String date) {
  // Пробуем стандартный ISO / DateTime.parse
  final iso = DateTime.tryParse(date);
  if (iso != null) return iso;

  // Пробуем формат dd.MM.yyyy или dd.MM.yyyy HH:mm
  try {
    final datePart = date.split(' ').first;
    final parts = datePart.split('.');
    if (parts.length == 3) {
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day);
    }
  } catch (_) {
    // Игнорируем ошибки парсинга и падаем в fallback ниже
  }

  // Fallback – очень старая дата, чтобы некорректные строки оказывались внизу
  return DateTime.fromMillisecondsSinceEpoch(0);
}

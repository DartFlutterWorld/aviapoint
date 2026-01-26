import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/presentation/widgets/update_required_bottom_sheet.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/cache_manager_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/list_stories_widget.dart';
import 'package:aviapoint/main_page/widgets/banner_main_widget.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
import 'package:aviapoint/main_page/widgets/home_section_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:upgrader/upgrader.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _versionChecked = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());

    if (BlocProvider.of<NewsBloc>(context).state is! SuccessNewsState) {
      // Загружаем все новости из всех категорий
      BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
    }

    // Загружаем продукты маркета
    final marketState = BlocProvider.of<AircraftMarketBloc>(context).state;
    if (marketState is! SuccessAircraftMarketState) {
      BlocProvider.of<AircraftMarketBloc>(context).add(const AircraftMarketEvent.getProducts(limit: 4, includeInactive: false));
    }

    // Загружаем статьи блога
    final blogArticlesState = BlocProvider.of<BlogArticlesBloc>(context).state;
    if (blogArticlesState is! SuccessBlogArticlesState) {
      BlocProvider.of<BlogArticlesBloc>(context).add(const GetBlogArticlesEvent(status: 'published', limit: 4));
    }

    // Проверяем версию приложения после загрузки главной страницы
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdate();
    });
  }

  void _refreshData() {
    // Обновляем категории новостей
    BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());

    // Обновляем новости
    // Загружаем все новости из всех категорий
    BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));

    // Обновляем продукты маркета
    BlocProvider.of<AircraftMarketBloc>(context).add(const AircraftMarketEvent.getProducts(limit: 4, includeInactive: false));

    // Обновляем статьи блога
    BlocProvider.of<BlogArticlesBloc>(context).add(const GetBlogArticlesEvent(status: 'published', limit: 4));

    // Обновляем истории
    BlocProvider.of<CacheManagerBloc>(context).add(const CacheManagerEvent.getStories());
  }

  Future<void> _checkForUpdate() async {
    // В debug режиме не проверяем версию
    if (kDebugMode) {
      debugPrint('🔧 Debug режим: проверка версии пропущена');
      return;
    }

    if (!mounted || _versionChecked) return;
    _versionChecked = true;

    try {
      // Используем upgrader для проверки версии
      // На главной странице MaterialLocalizations уже точно доступны
      final upgrader = Upgrader(
        debugLogging: true,
        // Проверяем при каждом запуске (durationUntilAlertAgain = 0)
        durationUntilAlertAgain: const Duration(seconds: 0),
      );

      // Инициализируем upgrader и проверяем версию
      await upgrader.initialize();

      // Ждем немного, чтобы upgrader успел проверить версию
      await Future<void>.delayed(const Duration(milliseconds: 1000));

      // Проверяем, нужно ли обновление
      if (upgrader.isUpdateAvailable()) {
        debugPrint('📢 MainScreen: Обновление доступно, показываем bottom sheet');
        if (mounted) {
          await showUpdateRequiredBottomSheet(context, upgrader: upgrader);
        }
      } else {
        debugPrint('✅ MainScreen: Обновление не требуется');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Ошибка при проверке версии через upgrader: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FDFF),
      appBar: CustomAppBar(
        title: 'Главная',
        withBack: false,
        withLogo: !kIsWeb,
        withProfile: true,
        actions: [
          // Provider.of<AppState>(context, listen: true).isAuthenticated
          //     ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
          //     : IconButton(
          //         onPressed: () => showLogin(context, callback: () => AutoRouter.of(context).navigate(const ProfileNavigationRoute())),
          //         icon: Icon(Icons.login),
          //       ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refreshData();
          // Ждем немного, чтобы показать индикатор обновления
          await Future<void>.delayed(const Duration(milliseconds: 500));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: AppSpacing.horizontal, right: AppSpacing.horizontal, top: AppSpacing.section),
          children: [
            const ListStoriesWidget(),
            SizedBox(height: AppSpacing.section),
            Builder(
              builder: (context) {
                if (kIsWeb) {
                  // На вебе используем Wrap с фиксированными размерами
                  return Wrap(
                    spacing: 11.0,
                    runSpacing: 11.0,
                    children: [
                      SizedBox(
                        width: 200.0, // Фиксированная ширина
                        height: 250.0, // Фиксированная высота
                        child: BannerMainWidget(
                          title: 'РосАвиаТест',
                          titleColor: const Color(0XFF374151),
                          descriptionColor: const Color(0XFF4B5767),
                          description: 'Экзаменационные билеты для пилотов и авиаперсонала в 2026г.',
                          picture: Pictures.pilotRatBanner,
                          onTap: () => startTestingFlowNew(context: context),
                          background: Pictures.backgroundRat,
                          titleButton: 'Тестирование',
                          backgroundColorButton: Colors.white,
                          borderColorButton: Colors.white,
                          textColorButton: const Color(0xFF0A6EFA),
                          pictureAlign: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(
                        width: 200.0, // Фиксированная ширина
                        height: 250.0, // Фиксированная высота
                        child: BannerMainWidget(
                          title: 'Учебное пособие',
                          titleColor: Colors.white,
                          descriptionColor: Colors.white,
                          description: 'Предполётный осмотр, запуск двигателя, полёт покругу',
                          picture: Pictures.planeRatBaner,
                          onTap: () => AutoRouter.of(context).push(const BaseRoute(children: [LearningNavigationRoute()])),
                          background: Pictures.leaningBackgroundBanner,
                          titleButton: 'Обучение',
                          backgroundColorButton: const Color(0xFF0A6EFA),
                          borderColorButton: const Color(0xFF0A6EFA),
                          textColorButton: Colors.white,
                          pictureAlign: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  );
                } else {
                  // На мобильных используем GridView
                  final orientation = MediaQuery.of(context).orientation;
                  final isLandscape = orientation == Orientation.landscape;
                  final childAspectRatio = isLandscape ? 0.7 : 0.85;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isLandscape ? 3 : 2, mainAxisSpacing: 11.w, crossAxisSpacing: 11.w, childAspectRatio: childAspectRatio),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return BannerMainWidget(
                          title: 'РосАвиаТест',
                          titleColor: const Color(0XFF374151),
                          descriptionColor: const Color(0XFF4B5767),
                          description: 'Экзаменационные билеты для пилотов и авиаперсонала в 2026г.',
                          picture: Pictures.pilotRatBanner,
                          onTap: () => startTestingFlowNew(context: context),
                          background: Pictures.backgroundRat,
                          titleButton: 'Тестирование',
                          backgroundColorButton: Colors.white,
                          borderColorButton: Colors.white,
                          textColorButton: const Color(0xFF0A6EFA),
                          pictureAlign: Alignment.bottomCenter,
                        );
                      } else {
                        return BannerMainWidget(
                          title: 'Учебное пособие',
                          titleColor: Colors.white,
                          descriptionColor: Colors.white,
                          description: 'Предполётный осмотр, запуск двигателя, полёт покругу',
                          picture: Pictures.planeRatBaner,
                          onTap: () => AutoRouter.of(context).push(const BaseRoute(children: [LearningNavigationRoute()])),
                          background: Pictures.leaningBackgroundBanner,
                          titleButton: 'Обучение',
                          backgroundColorButton: const Color(0xFF0A6EFA),
                          borderColorButton: const Color(0xFF0A6EFA),
                          textColorButton: Colors.white,
                          pictureAlign: Alignment.bottomRight,
                        );
                      }
                    },
                  );
                }
              },
            ),
            SizedBox(height: AppSpacing.section),
            // Маркет
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal, vertical: AppSpacing.section),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [BoxShadow(color: const Color(0xFF045EC5).withOpacity(0.08), blurRadius: 10.r, spreadRadius: 0, offset: Offset(0, 4.h))],
              ),
              child: Column(
                children: [
                  Text('Маркет', style: AppStyles.bold16s.copyWith(color: const Color(0xFF1F2937))),
                  SizedBox(height: AppSpacing.horizontal),
                  Text('Самолёты, вертолёты и запчасти для авиации', style: AppStyles.light14s.copyWith(color: const Color(0xFF4B5767))),
                  SizedBox(height: AppSpacing.section),
                  BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
                    builder: (context, state) => state.maybeWhen(
                      error: (message) => ErrorCustom(
                        textError: message,
                        repeat: () {
                          BlocProvider.of<AircraftMarketBloc>(context).add(const AircraftMarketEvent.getProducts(limit: 4, includeInactive: false));
                        },
                      ),
                      loading: () => LoadingCustom(paddingTop: 1.sw / 4),
                      success: (products, hasMore) => _SuccessMarketProducts(products: products, context: context),
                      orElse: () => LoadingCustom(paddingTop: 1.sw / 4),
                    ),
                  ),
                  SizedBox(height: AppSpacing.section),
                  HomeSectionButton(
                    title: 'Весь маркет',
                    color: const Color(0xFF10B981),
                    onPressed: () => AutoRouter.of(context).push(const BaseRoute(children: [MarketNavigationRoute()])),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.section),
            // Блог
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal, vertical: AppSpacing.section),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [BoxShadow(color: const Color(0xFF045EC5).withOpacity(0.08), blurRadius: 10.r, spreadRadius: 0, offset: Offset(0, 4.h))],
              ),
              child: Column(
                children: [
                  Text('АвиаБлог', style: AppStyles.bold16s.copyWith(color: const Color(0xFF1F2937))),
                  SizedBox(height: AppSpacing.horizontal),
                  Text('Статьи, обзоры и советы для пилотов и авиаэнтузиастов', style: AppStyles.light14s.copyWith(color: const Color(0xFF4B5767))),
                  SizedBox(height: AppSpacing.section),
                  BlocBuilder<BlogArticlesBloc, BlogArticlesState>(
                    builder: (context, state) => state.maybeWhen(
                      error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                        textError: errorForUser,
                        repeat: () {
                          BlocProvider.of<BlogArticlesBloc>(context).add(const GetBlogArticlesEvent(status: 'published', limit: 4));
                        },
                      ),
                      loading: () => LoadingCustom(paddingTop: 1.sw / 4),
                      success: (articles, hasMore) => _SuccessBlogArticles(articles: articles, context: context),
                      orElse: () => LoadingCustom(paddingTop: 1.sw / 4),
                    ),
                  ),
                  SizedBox(height: AppSpacing.section),
                  HomeSectionButton(
                    title: 'Все статьи',
                    color: const Color(0xFF7A0FD9),
                    onPressed: () => AutoRouter.of(context).push(BaseRoute(children: [BlogNavigationRoute()])),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.section),
            // Новости
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal, vertical: AppSpacing.section),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [BoxShadow(color: const Color(0xFF045EC5).withOpacity(0.08), blurRadius: 10.r, spreadRadius: 0, offset: Offset(0, 4.h))],
              ),
              child: Column(
                children: [
                  Text('Новости авиации', style: AppStyles.bold16s.copyWith(color: const Color(0xFF1F2937))),
                  SizedBox(height: AppSpacing.horizontal),
                  Text('Мы публикуем только актуальные и полезные новости для пилотов и авиаперсонала', style: AppStyles.light14s.copyWith(color: const Color(0xFF4B5767))),
                  SizedBox(height: AppSpacing.section),

                  BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) => state.map(
                      error: (state) => ErrorCustom(
                        textError: state.errorForUser,
                        repeat: () {
                          // Загружаем все новости из всех категорий
                          BlocProvider.of<NewsBloc>(context).add(const NewsEvent.get(authorId: null));
                        },
                      ),
                      loading: (state) => LoadingCustom(paddingTop: 1.sw / 4),
                      success: (state) => _SuccessNews(news: state.news, context: context),
                      creating: (state) => LoadingCustom(paddingTop: 1.sw / 4),
                      created: (state) => _SuccessNews(news: [state.news], context: context),
                      updating: (state) => LoadingCustom(paddingTop: 1.sw / 4),
                      updated: (state) => _SuccessNews(news: [state.news], context: context),
                      deleting: (state) => LoadingCustom(paddingTop: 1.sw / 4),
                      deleted: (state) => _SuccessNews(news: [], context: context),
                    ),
                  ),
                  SizedBox(height: AppSpacing.section),
                  HomeSectionButton(
                    title: 'Все новости',
                    color: const Color(0xFF0A6EFA),
                    onPressed: () => AutoRouter.of(context).push(const BaseRoute(children: [NewsNavigationRoute()])),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class _SuccessNews extends StatelessWidget {
  final List<NewsEntity> news;
  final BuildContext context;

  const _SuccessNews({required this.news, required this.context});

  @override
  Widget build(BuildContext context) {
    // Сортируем новости по дате: последние размещённые сверху
    final sortedNews = [...news]..sort((a, b) => _parseNewsDate(b.date).compareTo(_parseNewsDate(a.date)));
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    // Определяем количество колонок: на вебе адаптивно по ширине, в ландшафте 3, иначе 2
    final crossAxisCount = kIsWeb
        ? () {
            final width = MediaQuery.of(context).size.width;
            if (width >= 1200) return 4;
            if (width >= 900) return 3;
            if (width >= 600) return 2;
            return 1;
          }()
        : (isLandscape ? 3 : 2);

    final itemCount = kIsWeb
        ? (sortedNews.length >= crossAxisCount ? crossAxisCount : sortedNews.length)
        : (isLandscape ? (sortedNews.length >= 3 ? 3 : sortedNews.length) : (sortedNews.length >= 4 ? 4 : sortedNews.length));

    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.w, crossAxisSpacing: 10.w, crossAxisCount: crossAxisCount),
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => AutoRouter.of(context).push(
            BaseRoute(
              children: [
                NewsNavigationRoute(
                  children: [DetailNewsRoute(news: sortedNews[index], newsId: sortedNews[index].id)],
                ),
              ],
            ),
          ),
          // DetailNewsRoute(news: news[index], newsId: news[index].id)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: getImageUrl(sortedNews[index].pictureMini),
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => Shimmer(
                    duration: const Duration(milliseconds: 1000),
                    color: const Color(0xFF8D66FE),
                    colorOpacity: 0.2,
                    child: Container(decoration: const BoxDecoration()),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSpacing.horizontal),
                    decoration: BoxDecoration(color: const Color(0xFFD0F2FF), borderRadius: BorderRadius.circular(10.r)),
                    child: Text(sortedNews[index].title, style: AppStyles.regular12s.copyWith(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

/// Парсим дату/время статьи блога для сортировки.
/// Используем ISO-строки (`publishedAt` / `createdAt`), при ошибке возвращаем старую дату.
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

class _SuccessMarketProducts extends StatelessWidget {
  final List<AircraftMarketEntity> products;
  final BuildContext context;

  const _SuccessMarketProducts({required this.products, required this.context});

  @override
  Widget build(BuildContext context) {
    // Сортируем товары по дате создания: последние добавленные сверху
    final sortedProducts = [...products]..sort((a, b) => (b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)).compareTo(a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)));

    if (products.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(AppSpacing.section),
        child: Text(
          'Товары скоро появятся',
          style: AppStyles.light14s.copyWith(color: Color(0xFF4B5767)),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Builder(
      builder: (context) {
        // Адаптируем childAspectRatio в зависимости от ориентации
        final orientation = MediaQuery.of(context).orientation;
        final isLandscape = orientation == Orientation.landscape;
        // В landscape делаем элементы выше (меньше childAspectRatio)
        final childAspectRatio = isLandscape ? 0.9 : 0.77;

        // Определяем количество колонок: на вебе адаптивно по ширине, в ландшафте 3, иначе 2
        final crossAxisCount = kIsWeb
            ? () {
                final width = MediaQuery.of(context).size.width;
                if (width >= 1200) return 4;
                if (width >= 900) return 3;
                if (width >= 600) return 2;
                return 1;
              }()
            : (isLandscape ? 3 : 2);

        final itemCount = kIsWeb
            ? (sortedProducts.length > crossAxisCount ? crossAxisCount : sortedProducts.length)
            : (isLandscape ? (sortedProducts.length > 3 ? 3 : sortedProducts.length) : (sortedProducts.length > 4 ? 4 : sortedProducts.length));

        return SizedBox(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.w, crossAxisSpacing: 10.w, crossAxisCount: crossAxisCount, childAspectRatio: childAspectRatio),
            itemCount: itemCount,
            shrinkWrap: true,
            itemBuilder: (context, index) => AircraftMarketCard(
              product: sortedProducts[index],
              showEditButtons: false,
              showYearAndLocation: true,
              showInactiveBadge: false,
              onTap: () => AutoRouter.of(context).push(
                BaseRoute(
                  children: [
                    MarketNavigationRoute(children: [AircraftMarketDetailRoute(id: sortedProducts[index].id)]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SuccessBlogArticles extends StatelessWidget {
  final List<BlogArticleEntity> articles;
  final BuildContext context;

  const _SuccessBlogArticles({required this.articles, required this.context});

  @override
  Widget build(BuildContext context) {
    // Сортируем статьи блога: свежие сверху по publishedAt/createdAt
    final sortedArticles = [...articles]..sort((a, b) => _parseBlogDateTime(b.publishedAt ?? b.createdAt).compareTo(_parseBlogDateTime(a.publishedAt ?? a.createdAt)));

    if (sortedArticles.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(AppSpacing.section),
        child: Text(
          'Статьи скоро появятся',
          style: AppStyles.light14s.copyWith(color: Color(0xFF4B5767)),
          textAlign: TextAlign.center,
        ),
      );
    }

    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    // Определяем количество колонок: на вебе адаптивно по ширине, в ландшафте 3, иначе 2
    final crossAxisCount = kIsWeb
        ? () {
            final width = MediaQuery.of(context).size.width;
            if (width >= 1200) return 4;
            if (width >= 900) return 3;
            if (width >= 600) return 2;
            return 1;
          }()
        : (isLandscape ? 3 : 2);

    final itemCount = kIsWeb
        ? (sortedArticles.length > crossAxisCount ? crossAxisCount : sortedArticles.length)
        : (isLandscape ? (sortedArticles.length > 3 ? 3 : sortedArticles.length) : (sortedArticles.length > 4 ? 4 : sortedArticles.length));

    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.w, crossAxisSpacing: 10.w, crossAxisCount: crossAxisCount),
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => AutoRouter.of(context).push(
            BaseRoute(
              children: [
                BlogNavigationRoute(children: [BlogArticleDetailRoute(articleId: sortedArticles[index].id)]),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: sortedArticles[index].coverImageUrl != null && sortedArticles[index].coverImageUrl!.isNotEmpty ? getImageUrl(sortedArticles[index].coverImageUrl!) : '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer(
                    duration: const Duration(milliseconds: 1000),
                    color: const Color(0xFF8D66FE),
                    colorOpacity: 0.2,
                    child: Container(decoration: const BoxDecoration()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: const Color(0xFFD9E6F8),
                    child: const Icon(Icons.article, size: 48, color: Color(0xFF9CA5AF)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(color: Color(0xFFE8D5FF), borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      sortedArticles[index].title,
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
      ),
    );
  }
}

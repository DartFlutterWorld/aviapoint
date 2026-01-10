import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/list_stories_widget.dart';
import 'package:aviapoint/main_page/widgets/banner_main_widget.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());

    if (BlocProvider.of<NewsBloc>(context).state is! SuccessNewsState) {
      BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
    }

    // Загружаем статьи блога
    final blogArticlesState = BlocProvider.of<BlogArticlesBloc>(context).state;
    if (blogArticlesState is! SuccessBlogArticlesState) {
      BlocProvider.of<BlogArticlesBloc>(context).add(const GetBlogArticlesEvent(status: 'published', limit: 4));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FDFF),
      appBar: CustomAppBar(
        title: 'AviaPoint',
        withBack: false,
        withLogo: true,
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
      body: ListView(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        children: [
          ListStoriesWidget(),
          SizedBox(height: 22.h),
          Row(
            children: [
              BannerMainWidget(
                title: 'РосАвиаТест',
                titleColor: Color(0XFF374151),
                descriptionColor: Color(0XFF4B5767),
                description: 'Экзаменационные билеты для пилотов и авиаперсонала в 2025 г.',
                picture: Pictures.pilotRatBanner,
                onTap: () => startTestingFlowNew(context: context),
                background: Pictures.backgroundRat,
                titleButton: 'Тестирование',
                backgroundColorButton: Colors.white,
                borderColorButton: Colors.white,
                textColorButton: Color(0xFF0A6EFA),
                pictureAlign: Alignment.bottomCenter,
              ),
              SizedBox(width: 11.w),
              BannerMainWidget(
                title: 'Учебное пособие',
                titleColor: Colors.white,
                descriptionColor: Colors.white,
                description: 'Предполётный осмотр, запуск двигателя, полёт покругу',
                picture: Pictures.planeRatBaner,
                onTap: () => AutoRouter.of(context).push(const BaseRoute(children: [LearningNavigationRoute()])),
                background: Pictures.leaningBackgroundBanner,
                titleButton: 'Обучение',
                backgroundColorButton: Color(0xFF0A6EFA),
                borderColorButton: Color(0xFF0A6EFA),
                textColorButton: Colors.white,
                pictureAlign: Alignment.bottomRight,
              ),
            ],
          ),
          SizedBox(height: 22.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [BoxShadow(color: Color(0xFF045EC5).withOpacity(0.08), blurRadius: 10, spreadRadius: 0, offset: Offset(0, 4))],
            ),
            child: Column(
              children: [
                Text('Новости авиации', style: AppStyles.bold16s.copyWith(color: Color(0xFF1F2937))),
                SizedBox(height: 6.h),
                Text('Мы публикуем только актуальные и полезные новости для пилотов и авиаперсонала', style: AppStyles.light14s.copyWith(color: Color(0xFF4B5767))),
                SizedBox(height: 16.h),

                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) => state.map(
                    error: (state) => ErrorCustom(
                      textError: state.errorForUser,
                      repeat: () {
                        BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
                      },
                    ),
                    loading: (state) => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
                    success: (state) => _SuccessNews(news: state.news),
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  verticalPadding: 8,
                  backgroundColor: Color(0xFF0A6EFA),
                  title: 'Все новости',
                  textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  borderColor: Color(0xFF0A6EFA),
                  borderRadius: 46,
                  boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                  // onPressed: () => context.router.push(NewsNavigationRoute()),
                  onPressed: () => AutoRouter.of(context).push(const BaseRoute(children: [NewsNavigationRoute()])),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [BoxShadow(color: Color(0xFF045EC5).withOpacity(0.08), blurRadius: 10, spreadRadius: 0, offset: Offset(0, 4))],
            ),
            child: Column(
              children: [
                Text('Авиаблог', style: AppStyles.bold16s.copyWith(color: Color(0xFF1F2937))),
                SizedBox(height: 6.h),
                Text('Статьи, обзоры и советы для пилотов и авиаэнтузиастов', style: AppStyles.light14s.copyWith(color: Color(0xFF4B5767))),
                SizedBox(height: 16.h),
                BlocBuilder<BlogArticlesBloc, BlogArticlesState>(
                  builder: (context, state) => state.maybeWhen(
                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                      textError: errorForUser,
                      repeat: () {
                        BlocProvider.of<BlogArticlesBloc>(context).add(const GetBlogArticlesEvent(status: 'published', limit: 4));
                      },
                    ),
                    loading: () => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
                    success: (articles, hasMore) => _SuccessBlogArticles(articles: articles),
                    orElse: () => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  verticalPadding: 8,
                  backgroundColor: Color(0xFF7A0FD9),
                  title: 'Все статьи',
                  textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  borderColor: Color(0xFF7A0FD9),
                  borderRadius: 46,
                  boxShadow: [BoxShadow(color: Color(0xFF7A0FD9).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                  onPressed: () => AutoRouter.of(context).push(BlogNavigationRoute()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessNews extends StatelessWidget {
  final List<NewsEntity> news;

  const _SuccessNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 420,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => AutoRouter.of(context).push(
            BaseRoute(
              children: [
                NewsNavigationRoute(
                  children: [DetailNewsRoute(news: news[index], newsId: news[index].id)],
                ),
              ],
            ),
          ),
          // DetailNewsRoute(news: news[index], newsId: news[index].id)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: getImageUrl(news[index].pictureMini),
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Color(0xFFD0F2FF), borderRadius: BorderRadius.circular(10)),
                    child: Text(news[index].title, style: AppStyles.regular12s.copyWith(color: Colors.black)),
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

class _SuccessBlogArticles extends StatelessWidget {
  final List<BlogArticleEntity> articles;

  const _SuccessBlogArticles({required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Text(
          'Статьи скоро появятся',
          style: AppStyles.light14s.copyWith(color: Color(0xFF4B5767)),
          textAlign: TextAlign.center,
        ),
      );
    }

    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
        itemCount: articles.length > 4 ? 4 : articles.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => AutoRouter.of(context).push(BlogArticleDetailRoute(articleId: articles[index].id)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: articles[index].coverImageUrl != null && articles[index].coverImageUrl!.isNotEmpty ? getImageUrl(articles[index].coverImageUrl!) : '',
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Color(0xFFE8D5FF), borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      articles[index].title,
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

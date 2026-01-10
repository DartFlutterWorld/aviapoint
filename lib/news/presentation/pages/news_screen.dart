import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/news/presentation/cubit/news_cubit.dart';
import 'package:aviapoint/news/presentation/widgets/big_news_widget.dart';
import 'package:aviapoint/news/presentation/widgets/small_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

@override
class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());
    BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Новости авиации', withBack: false, withProfile: true),
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          SizedBox(height: 8),
          BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
            builder: (context, state) => state.map(
              loading: (state) => SizedBox(),
              error: (state) => ErrorCustom(
                textError: state.errorForUser,
                repeat: () {
                  BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());
                  BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
                },
              ),
              success: (state) => _CategorySuccess(category: state.categoryNews),
            ),
          ),
          SizedBox(height: 12),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) => state.map(
              error: (state) => ErrorCustom(
                textError: state.errorForUser,
                repeat: () {
                  BlocProvider.of<CategoryNewsBloc>(context).add(GetCategoryNewsEvent());
                  BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
                },
              ),
              loading: (state) => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
              success: (state) => _Success(news: state.news),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySuccess extends StatefulWidget {
  final List<CategoryNewsEntity> category;

  const _CategorySuccess({required this.category});

  @override
  State<_CategorySuccess> createState() => _CategorySuccessState();
}

class _CategorySuccessState extends State<_CategorySuccess> {
  // int activeNewsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 29.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.category.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              BlocProvider.of<NewsCubit>(context, listen: false).setCategoryId(index);
              BlocProvider.of<NewsCubit>(context, listen: false).setTitleCategory(widget.category[index].title);

              // Если индекс категории 0 то запрашиваем все новости. Идея в том чтобы в первой категории Свежие или например Все, показывались все новости,
              // а в конкретном рзделе чтоб только отфильтрованные по разделу.
              if (index == 0) {
                BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
              } else {
                BlocProvider.of<NewsBloc>(context).add(GetNewsByCategoryEvent(categoryId: index));
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: BlocProvider.of<NewsCubit>(context, listen: true).state.categoryId == index
                    ? Color(0xFF0A6EFA)
                    : Color(0xFFD9E6F8),
                borderRadius: BorderRadius.circular(5),
                boxShadow: BlocProvider.of<NewsCubit>(context, listen: true).state.categoryId == index
                    ? [
                        BoxShadow(
                          color: Color(0xff0A6EFA).withOpacity(0.25),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                widget.category[index].title,
                style: AppStyles.mediumItalic13s.copyWith(
                  color: BlocProvider.of<NewsCubit>(context, listen: true).state.categoryId == index
                      ? Color(0xFFFFFFFF)
                      : Color(0xFF0A6EFA),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<NewsEntity> news;
  const _Success({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => AutoRouter.of(context).push(DetailNewsRoute(news: news[index], newsId: news[index].id)),
        child: news[index].isBigNews ? BigNewsWidget(news: news[index]) : SmallNewsWidget(news: news[index]),
      ),
    );
  }
}

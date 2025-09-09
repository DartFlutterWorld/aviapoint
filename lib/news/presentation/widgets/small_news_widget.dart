import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SmallNewsWidget extends StatelessWidget {
  const SmallNewsWidget({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  String getTitleCstegory({required int categoryId, required BuildContext context}) {
    return BlocProvider.of<CategoryNewsBloc>(context).allCategory.elementAt(categoryId).title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFD9E6F8),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: backUrl + news.pictureMini,
              fit: BoxFit.fill,
              placeholder: (context, url) => Shimmer(
                duration: const Duration(milliseconds: 1000),
                color: const Color(0xFF8D66FE),
                colorOpacity: 0.2,
                child: Container(
                  decoration: const BoxDecoration(),
                ),
              ),
              height: 75.h,
              width: 75.w,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTitleCstegory(categoryId: news.categoryId, context: context).toUpperCase(),
                      style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF)),
                    ),
                    Text(
                      news.date,
                      style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF)),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  news.title,
                  style: AppStyles.medium14s.copyWith(color: Color(0xFF374151)),
                ),
                SizedBox(height: 5),
                if (news.subTitle.isNotEmpty)
                  Text(
                    news.subTitle,
                    style: AppStyles.light10s.copyWith(color: Color(0xFF374151)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

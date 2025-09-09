import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/presentation/bloc/category_news_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget {
  final NewsEntity news;
  final int newsId;

  const DetailNewsScreen({
    super.key,
    @PathParam('id') required this.newsId,
    required this.news,
  });

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  String getTitleCstegory({required int categoryId, required BuildContext context}) {
    return BlocProvider.of<CategoryNewsBloc>(context).allCategory.elementAt(categoryId).title;
  }

  void openSource(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Новости авиации',
        withBack: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color(0xFFD9E6F8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: backUrl + widget.news.pictureBig,
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer(
                  duration: const Duration(milliseconds: 1000),
                  color: const Color(0xFF8D66FE),
                  colorOpacity: 0.2,
                  child: Container(
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTitleCstegory(categoryId: widget.news.categoryId, context: context).toUpperCase(),
                        style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                      Text(
                        widget.news.date,
                        style: AppStyles.light10s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.news.title,
                    style: AppStyles.medium14s.copyWith(color: Color(0xFF374151)),
                  ),
                  SizedBox(height: 5),
                  HtmlWidget(
                    widget.news.body,
                  ),
                  SizedBox(height: 16),
                  if (widget.news.source.isNotEmpty)
                    GestureDetector(
                      onTap: () => openSource(widget.news.source),
                      child: Text(
                        widget.news.source,
                        style: AppStyles.medium14s.copyWith(
                          color: Color(0xFF0A6EFA),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0A6EFA),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

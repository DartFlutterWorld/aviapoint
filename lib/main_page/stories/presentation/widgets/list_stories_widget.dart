import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/cache_manager_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/story_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:provider/provider.dart';

class ListStoriesWidget extends StatefulWidget {
  const ListStoriesWidget({super.key});

  @override
  State<ListStoriesWidget> createState() => _ListStoriesWidgetState();
}

class _ListStoriesWidgetState extends State<ListStoriesWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _current = 0;

  // void _sendAnalyticsEventMainStoryPosition({required BuildContext context, required int position}) {
  //   FirebaseAnalyticsEvent analytics = Provider.of<FirebaseAnalyticsEvent>(context, listen: false);

  //   analytics.logEvent(nameEvent: 'MainStoryPosition', parameters: <String, dynamic>{
  //     'user': Provider.of<AppState>(context, listen: false).auth?.profile.id ?? 'Unknown user',
  //     'screen': AutoRouter.of(context).currentPath,
  //     'position': '${_current + 1}',
  //   });
  // }

  // void _sendAnalyticsEventMainStoryPositionSwipe({required BuildContext context}) {
  //   FirebaseAnalyticsEvent analytics = Provider.of<FirebaseAnalyticsEvent>(context, listen: false);

  //   analytics.logEvent(nameEvent: 'MainStoryPositionSwipe', parameters: <String, dynamic>{
  //     'user': Provider.of<AppState>(context, listen: false).auth?.profile.id ?? 'Unknown user',
  //     'screen': AutoRouter.of(context).currentPath,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CacheManagerBloc, CacheManagerState>(
      builder: (context, state) {
        if (state is SuccessCacheManagerState && state.story.isNotEmpty) {
          return SizedBox(
            height: 100.h,
            width: 100.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.story.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(DetailStoryRoute(idStory: state.story[index].id, stories: state.story, currentIndex: index));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: BlocProvider.of<StoryCubit>(context, listen: true).state.listStories.contains(state.story[index].id) ? null : Border.all(color: Color(0xFF0A6EFA), width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: getImageUrl(state.story[index].logoStory),
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Shimmer(
                              duration: const Duration(milliseconds: 1000),
                              color: const Color(0xFF8D66FE),
                              colorOpacity: 0.2,
                              child: Container(decoration: const BoxDecoration()),
                            ),
                            height: 100.h,
                            width: 100.w,
                            cacheManager: getIt<DefaultCacheManager>(),
                            cacheKey: getImageUrl(state.story[index].logoStory),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(state.story[index].title, style: AppStyles.regular13s.copyWith(color: Color(0xFF374151))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return Container(
          height: 100.h,
          width: 100.w,
          margin: const EdgeInsets.only(right: 8).r,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Shimmer(
                  duration: const Duration(milliseconds: 1000),
                  color: const Color(0xFF8D66FE),
                  colorOpacity: 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(height: 100.h, width: 100.w, decoration: const BoxDecoration()),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

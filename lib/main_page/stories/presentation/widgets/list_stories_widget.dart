import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/cache_manager_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/story_cubit.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ListStoriesWidget extends StatefulWidget {
  const ListStoriesWidget({super.key});

  @override
  State<ListStoriesWidget> createState() => _ListStoriesWidgetState();
}

class _ListStoriesWidgetState extends State<ListStoriesWidget> {
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
        return BlocBuilder<StoryCubit, StoryState>(
          builder: (context, storyState) {
            if (state is SuccessCacheManagerState && state.story.isNotEmpty) {
              // Фиксированный размер 100x100 для всех элементов (квадрат)
              final itemSize = Provider.of<AppState>(context, listen: true).isTablet ? 200.0 : 120.0;

              return SizedBox(
                height: itemSize,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: state.story.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(
                        DetailStoryRoute(idStory: state.story[index].id, stories: state.story, currentIndex: index),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: AppStyles.adaptiveHorizontalPadding(context)),
                      child: SizedBox(
                        width: itemSize,
                        height: itemSize,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: storyState.listStories.contains(state.story[index].id)
                                ? null
                                : Border.all(color: const Color(0xFF0A6EFA), width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                NetworkImageWidget(
                                  imageUrl: getImageUrl(state.story[index].logoStory),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                                      ),
                                    ),
                                    child: Text(
                                      state.story[index].title,
                                      style: AppStyles.regular12s.copyWith(color: Colors.white),
                                      textAlign: TextAlign.center,
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
                    ),
                  ),
                ),
              );
            }

            // Loading state
            final itemSize = 100.0;

            return SizedBox(
              height: itemSize,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Shimmer(
                        duration: const Duration(milliseconds: 1000),
                        color: const Color(0xFF8D66FE),
                        colorOpacity: 0.2,
                        child: SizedBox(
                          width: itemSize,
                          height: itemSize,
                          child: Container(decoration: const BoxDecoration()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

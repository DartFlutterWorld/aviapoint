import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/story_screen_element.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryScreenWidget extends StatelessWidget {
  final List<StoryEntity> stories;
  final String videoPreview;
  final String buttonColor;
  final String textColor;
  final AnimationController? animController;
  final CachedVideoPlayerPlusController? videoController;
  final VoidCallback onTapScreenRight;
  final VoidCallback onTapScreenLeft;
  final VoidCallback onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final int currentIndex;
  final bool isVisible;
  const StoryScreenWidget({
    super.key,
    required this.stories,
    required this.videoPreview,
    required this.buttonColor,
    required this.textColor,
    this.animController,
    this.videoController,
    required this.onTapScreenRight,
    required this.onTapScreenLeft,
    required this.currentIndex,
    required this.isVisible,
    required this.onLongPress,
    required this.onLongPressEnd,
  });

  // void _sendAnalyticsEventMiniStoryClickClose({required BuildContext context}) {
  //   FirebaseAnalyticsEvent analytics = Provider.of<FirebaseAnalyticsEvent>(context, listen: false);

  //   analytics.logEvent(nameEvent: 'MiniStoryClickClose', parameters: <String, dynamic>{
  //     'user': Provider.of<AppState>(context, listen: false).auth?.profile.id ?? 'Unknown user',
  //     'screen': AutoRouter.of(context).currentPath,
  //     'positionMiniStory': '${BlocProvider.of<StoryCubit>(context).state.currentIndexMiniStory + 1}',
  //     'positionStory': '${BlocProvider.of<StoryCubit>(context).state.currentIndexStory + 1}'
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return kIsWeb && !(defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android)
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: size.width,
            height: size.width * 1.2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onTapScreenLeft,
                          child: Container(
                            color: Colors.transparent,
                            // width: 110,
                            width: size.width * 0.1,
                            height: 200,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svg/left_arrow.svg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[850]!,
                                blurRadius: 150.0,
                                blurStyle: BlurStyle.outer,
                                offset: const Offset(
                                  0.0,
                                  0.0,
                                ),
                              ),
                            ],
                          ),
                          child: StoryScreenElement(
                            stories: stories,
                            videoPreview: videoPreview,
                            buttonColor: buttonColor,
                            textColor: textColor,
                            onTapScreenRight: onTapScreenRight,
                            onTapScreenLeft: onTapScreenLeft,
                            currentIndex: currentIndex,
                            isVisible: false,
                            videoController: videoController,
                            animController: animController,
                            onLongPress: onLongPress,
                            onLongPressEnd: onLongPressEnd,
                          ),
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: onTapScreenRight,
                                child: SizedBox(
                                  width: size.width * 0.1,
                                  height: 200,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/right_arrow.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   child: Transform.translate(
                            //     offset: const Offset(20, 0),
                            //     child: Align(
                            //       alignment: Alignment.topRight,
                            //       child: GestureDetector(
                            //         onTap: () {
                            //           AutoRouter.of(context).maybePop();
                            //           // _sendAnalyticsEventMiniStoryClickClose(context: context);
                            //         },
                            //         child: Container(
                            //           padding: const EdgeInsets.all(4),
                            //           width: 30,
                            //           height: 30,
                            //           child: SvgPicture.asset(
                            //             'assets/svg/close_icon.svg',
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : LayoutBuilder(
            builder: (context, constraints) => Padding(
              padding: EdgeInsets.only(
                top: kIsWeb ? 16 : MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).padding.top + 16,
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 9,
                    child: StoryScreenElement(
                      stories: stories,
                      videoPreview: videoPreview,
                      buttonColor: buttonColor,
                      textColor: textColor,
                      onTapScreenRight: onTapScreenRight,
                      onTapScreenLeft: onTapScreenLeft,
                      currentIndex: currentIndex,
                      isVisible: isVisible,
                      videoController: videoController,
                      animController: animController,
                      onLongPress: onLongPress,
                      onLongPressEnd: onLongPressEnd,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).maybePop();
                          // _sendAnalyticsEventMiniStoryClickClose(context: context);
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          color: Colors.transparent,
                          width: double.infinity,
                          child: Center(
                            child: Transform.rotate(
                              angle: 90 * (pi / 180),
                              child: SvgPicture.asset(
                                Pictures.rightArrow,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

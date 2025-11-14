import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/story_player.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/up_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class StoryScreenElement extends StatelessWidget {
  final List<StoryEntity> stories;
  final String videoPreview;
  final String buttonColor;
  final String textColor;
  final AnimationController? animController;
  final CachedVideoPlayerPlus? videoPlayer;
  final VoidCallback onTapScreenRight;
  final VoidCallback onTapScreenLeft;
  final VoidCallback onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final int currentIndex;
  final bool isVisible;
  const StoryScreenElement({
    super.key,
    required this.stories,
    required this.videoPreview,
    required this.buttonColor,
    required this.textColor,
    this.animController,
    this.videoPlayer,
    required this.onTapScreenRight,
    required this.onTapScreenLeft,
    required this.currentIndex,
    required this.isVisible,
    required this.onLongPress,
    required this.onLongPressEnd,
  });

  Future<void> startUrl({required String url, required BuildContext context}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  // void _sendAnalyticsEventMiniStoryClickButton({required BuildContext context, required int position}) {
  //   FirebaseAnalyticsEvent analytics = Provider.of<FirebaseAnalyticsEvent>(context, listen: false);

  //   analytics.logEvent(nameEvent: 'MiniStoryClickButton', parameters: <String, dynamic>{
  //     'user': Provider.of<AppState>(context, listen: false).auth?.profile.id ?? 'Unknown user',
  //     'screen': AutoRouter.of(context).currentPath,
  //     'position': '$position',
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final StoryEntity story = stories[currentIndex];
    return Stack(
      alignment: Alignment.center,
      children: [
        story.video == null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: GestureDetector(
                    onLongPress: onLongPress,
                    onLongPressEnd: onLongPressEnd,
                    child: CachedNetworkImage(imageUrl: getImageUrl(story.image), fit: BoxFit.cover, cacheManager: getIt<DefaultCacheManager>(), cacheKey: getImageUrl(story.image)),
                  ),
                ),
              )
            : (videoPlayer != null && videoPlayer!.controller.value.isInitialized)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: videoPlayer!.controller.value.aspectRatio,
                  child: GestureDetector(onLongPress: onLongPress, onLongPressEnd: onLongPressEnd, child: VideoPlayer(videoPlayer!.controller)),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12).r,
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Stack(
                    children: [
                      CachedNetworkImage(fit: BoxFit.cover, imageUrl: getImageUrl(story.image), cacheManager: getIt<DefaultCacheManager>(), cacheKey: getImageUrl(story.image)),
                      const Center(child: LoadingCustom()),
                    ],
                  ),
                ),
              ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    ...stories.asMap().map((index, e) {
                      return MapEntry(index, animController != null ? AnimatedBar(animController: animController!, position: index, currentIndex: currentIndex) : const SizedBox());
                    }).values,
                    SizedBox(width: 13),
                    // TODO. Не работает кнопка закрыть сторик
                    GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => AutoRouter.of(context).maybePop(), child: SvgPicture.asset(Pictures.closeStory)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTapScreenRight,
              child: Container(
                width: 80,
                color: Colors.transparent,
                child: Visibility(
                  visible: isVisible,
                  replacement: const SizedBox.expand(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Align(alignment: Alignment.centerRight, child: SvgPicture.asset(Pictures.rightArrow)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onTapScreenLeft,
              child: Container(
                width: 80,
                color: Colors.transparent,
                child: Visibility(
                  visible: isVisible,
                  replacement: const SizedBox.expand(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Align(alignment: Alignment.centerLeft, child: SvgPicture.asset(Pictures.leftArrow)),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: GestureDetector(
        //       onTap: () {
        //         AutoRouter.of(context).maybePop();
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 11, top: 30),
        //         child: Container(
        //           width: 30,
        //           height: 30,
        //           color: Colors.transparent,
        //           child: Align(
        //             alignment: Alignment.topRight,
        //             child: SvgPicture.asset(Pictures.closeStory),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        if (story.textButton.isNotEmpty)
          Positioned.fill(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 45, left: 21, right: 21).r,
                    child: UpAnimation(
                      withFadeTransition: true,
                      milSecDuration: 300,
                      delay: 0,
                      begin: const Offset(0, 0),
                      end: Offset.zero,
                      curve: Curves.ease,
                      child: SizedBox(
                        // height: 50.h,
                        height: kIsWeb ? constraints.maxHeight / 60 + 50 : 50.h,
                        child: CustomButton(
                          title: story.textButton,
                          backgroundColor: Color(int.parse('0xFF$buttonColor')),
                          onPressed: () {
                            // AutoRouter.of(context).maybePop();
                            videoPlayer?.controller.pause();
                            animController?.stop();
                            Navigator.pop(context);
                            // _sendAnalyticsEventMiniStoryClickButton(context: context, position: currentIndex + 1);
                            startUrl(url: story.hyperlink, context: context);
                          },
                          textStyle: AppStyles.button.copyWith(color: Color(int.parse('0xFF$textColor')), overflow: TextOverflow.ellipsis),
                          borderColor: Color(int.parse('0xFF$buttonColor')),
                          boxShadow: const [],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

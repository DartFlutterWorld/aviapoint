import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/story_screen_widget.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';

class StoryPlayer extends StatefulWidget {
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

  const StoryPlayer({
    super.key,
    required this.stories,
    required this.videoPreview,
    required this.buttonColor,
    required this.textColor,
    required this.animController,
    required this.videoPlayer,
    required this.onTapScreenRight,
    required this.onTapScreenLeft,
    required this.currentIndex,
    required this.onLongPress,
    required this.onLongPressEnd,
  });

  @override
  State<StoryPlayer> createState() => _StoryPlayerState();
}

class _StoryPlayerState extends State<StoryPlayer> {
  bool isVisible = true;

  @override
  void initState() {
    _timerShowArrow();
    super.initState();
  }

  void _timerShowArrow() async {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF223B76),
      body: StoryScreenWidget(
        stories: widget.stories,
        videoPreview: widget.videoPreview,
        buttonColor: widget.buttonColor,
        textColor: widget.textColor,
        onTapScreenRight: widget.onTapScreenRight,
        onTapScreenLeft: widget.onTapScreenLeft,
        currentIndex: widget.currentIndex,
        isVisible: isVisible,
        videoPlayer: widget.videoPlayer,
        animController: widget.animController,
        onLongPress: widget.onLongPress,
        onLongPressEnd: widget.onLongPressEnd,
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({super.key, required this.animController, required this.position, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex ? Colors.white : Colors.white.withValues(alpha: 0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(constraints.maxWidth * animController.value, Colors.white);
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.0)),
    );
  }
}

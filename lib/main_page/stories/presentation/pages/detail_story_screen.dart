import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/cache_manager_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/detail_story_bloc.dart';
import 'package:aviapoint/main_page/stories/presentation/bloc/story_cubit.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/story_player.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

@RoutePage()
class DetailStoryScreen extends StatefulWidget {
  final int idStory;
  final int currentIndex;
  final List<StoryEntity> stories;

  const DetailStoryScreen({
    super.key,
    @PathParam('id') required this.idStory,
    required this.stories,
    required this.currentIndex,
  });

  @override
  State<DetailStoryScreen> createState() => _DetailStoryScreenState();
}

class _DetailStoryScreenState extends State<DetailStoryScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animController;
  CachedVideoPlayerPlusController? _videoController;
  late StoryCubit storyCubit;

  @override
  void initState() {
    super.initState();
    storyCubit = StoryCubit();
    storyCubit.setCurrentIndex(widget.currentIndex);
    // _loadStory(story: widget.stories[storyCubit.state.currentIndex]);

    BlocProvider.of<DetailStoryBloc>(context).add(DetailStoryEvent.get(id: widget.idStory));

    _animController = AnimationController(vsync: this);

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController?.stop();
        _animController?.reset();
        if (storyCubit.state.currentIndex < widget.stories.length - 1) {
          _videoController?.pause();
          _loadStory(story: widget.stories[storyCubit.state.currentIndex + 1]);
          storyCubit.setCurrentIndex(storyCubit.state.currentIndex + 1);
        } else {
          _videoController?.pause();
          Navigator.of(context).pop();
        }
      }
    });
  }

  void _loadStory({required StoryEntity story}) async {
    _animController?.stop();
    _animController?.reset();

    if (story.video == null) {
      _animController?.duration = Duration(seconds: story.timeShow);
      _animController?.forward();
    } else {
      BlocProvider.of<StoryCubit>(context).setShowStory(id: story.id);
      _videoController?.dispose();
      _videoController = null;

      _videoController = kIsWeb
          ? CachedVideoPlayerPlusController.networkUrl(Uri.parse('$backUrl${story.video}'))
          : CachedVideoPlayerPlusController.file(await getIt<DefaultCacheManager>().getSingleFile('$backUrl${story.video}'))
        // _videoController = CachedVideoPlayerPlusController.networkUrl(Uri.parse('$backUrl${miniStory.video}'))
        ..initialize().then((_) {
          if (mounted) {
            setState(() {});

            if (_videoController!.value.isInitialized) {
              _animController?.duration = _videoController?.value.duration;
              // _animController?.duration = Duration(seconds: 2);
              _videoController?.play();
              _animController?.forward();
            }
          }
        });
    }
  }

  void _onTapScreen(String side, List<StoryEntity> miniStories, BuildContext context) {
    if (side == 'left') {
      _videoController?.pause(); // Если нажали на левом экране то остановить видео, чтоб не было звука на предыдущих сторях

      // Если смотрим первый стори и первый министорик и нажимае назад то выходим из сторей
      if (storyCubit.state.currentIndex == 0) {
        Navigator.of(context).pop();
        // Если находимся не на первой сторе и смотрим первый министорик и при нажтии назад подгружаем педыдущую сторю со сториками
      } else if (storyCubit.state.currentIndex > 0 && widget.stories.length != storyCubit.state.currentIndex - 1) {
        _videoController?.pause();

        _loadStory(story: widget.stories[storyCubit.state.currentIndex - 1]);
        storyCubit.setCurrentIndex(storyCubit.state.currentIndex - 1);
      }
    }
    if (side == 'right') {
      if (storyCubit.state.currentIndex < widget.stories.length - 1) {
        _videoController?.pause(); // Если нажали на правом экране то остановить видео, чтоб не было звука на предыдущих сторях

        _loadStory(story: widget.stories[storyCubit.state.currentIndex + 1]);
        storyCubit.setCurrentIndex(storyCubit.state.currentIndex + 1);
      } else {
        _videoController?.pause();
        Navigator.of(context).pop();
      }
    }

    if (side == 'onLongPress') {
      if (_videoController != null && _videoController!.value.isPlaying) {
        _videoController?.pause();
        _animController?.stop();
      } else {
        _videoController?.dispose();
        _animController?.stop();
      }
    }
    if (side == 'onLongPressEnd') {
      if (_videoController != null && !_videoController!.value.isPlaying) {
        _videoController?.play();
        _animController?.forward();
      } else {
        _videoController?.dispose();
        _animController?.forward();
      }
    }
  }

  // void _sendAnalyticsEventMiniStoryClickSide({required BuildContext context, required String side}) {
  //   FirebaseAnalyticsEvent analytics = Provider.of<FirebaseAnalyticsEvent>(context, listen: false);

  //   analytics.logEvent(nameEvent: 'MiniStoryClickNextBack', parameters: <String, dynamic>{
  //     'user': Provider.of<AppState>(context, listen: false).auth?.profile.id ?? 'Unknown user',
  //     'screen': AutoRouter.of(context).currentPath,
  //     'side': side,
  //     'positionMiniStory': '${storyCubit.state.currentIndexMiniStory + 1}',
  //     'positionStory': '${storyCubit.state.currentIndexStory + 1}'
  //   });
  // }

  @override
  void dispose() {
    _animController?.dispose();

    _videoController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF223B76),
      body: BlocConsumer<DetailStoryBloc, DetailStoryState>(
        listener: (context, state) {
          if (state is SuccessDetailStoryState) {
            _loadStory(story: state.detailstory);
          }
        },
        builder: (context, state) {
          if (state is SuccessDetailStoryState) {
            return BlocBuilder<StoryCubit, StoryState>(
              builder: (context, state2) {
                return StoryPlayer(
                  stories: [state.detailstory],
                  videoPreview: state.detailstory.image ?? '',
                  buttonColor: state.detailstory.colorButton,
                  textColor: state.detailstory.textColor,
                  animController: _animController,
                  videoController: _videoController,
                  onTapScreenRight: () => _onTapScreen('right', BlocProvider.of<CacheManagerBloc>(context).stories, context),
                  onTapScreenLeft: () => _onTapScreen('left', BlocProvider.of<CacheManagerBloc>(context).stories, context),
                  onLongPress: () => _onTapScreen('onLongPress', BlocProvider.of<CacheManagerBloc>(context).stories, context),
                  onLongPressEnd: (details) => _onTapScreen('onLongPressEnd', BlocProvider.of<CacheManagerBloc>(context).stories, context),
                  currentIndex: state2.currentIndex,
                );
              },
            );
          }

          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: LoadingCustom(),
            ),
          );
        },
      ),
    );
  }
}

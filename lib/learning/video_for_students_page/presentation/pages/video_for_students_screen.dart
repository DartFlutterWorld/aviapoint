import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/bloc/video_for_students_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';

@RoutePage()
class VideoForStudentsScreen extends StatefulWidget {
  const VideoForStudentsScreen({super.key});

  @override
  State<VideoForStudentsScreen> createState() => _VideoForStudentsScreenState();
}

class _VideoForStudentsScreenState extends State<VideoForStudentsScreen> {
  VideoPlayerController? _videoPlayerController;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Получаем информацию о видео по айдищнику и потом дёргаем урл видео
    BlocProvider.of<VideoForStudentsBloc>(context).add(GetByIdVideoForStudentsEvent(0));
    //  ServiceLocator.instance.get<MyRouteObserver>().
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   Helper.routeObserver.subscribe(this, ModalRoute.of(context)!);
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController?.dispose();
    _chewieController.dispose();

    // ServiceLocator.instance.get<AppRouter>().removeListener(routeListener);
  }

  void _loadVideo(String url) async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(getImageUrl(url)));
    await Future.wait([_videoPlayerController!.initialize()]);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Учебное пособие', withBack: true),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<VideoForStudentsBloc, VideoForStudentsState>(
          listener: (context, state) {
            if (state is SuccessByIdVideoForStudentsState) {
              setState(() {
                _loadVideo(state.videoForStudents.url);
              });
            }
          },
          builder: (context, state) => state.maybeMap(
            loading: (value) => LoadingCustom(),
            error: (value) => ErrorCustom(
              textError: value.errorForUser,
              repeat: () {
                BlocProvider.of<VideoForStudentsBloc>(context).add(GetByIdVideoForStudentsEvent(0));
              },
            ),
            orElse: () => LoadingCustom(),
            successById: (value) => (_videoPlayerController != null && _videoPlayerController!.value.isInitialized)
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VisibilityDetector(
                          key: Key('my-widget-key'),
                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage = visibilityInfo.visibleFraction * 100;
                            debugPrint('Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');

                            if (visibilityInfo.visibleFraction == 1) {
                              _chewieController.play();
                            } else {
                              if (_chewieController.allowFullScreen == true) {
                                _chewieController.play();
                              } else {
                                _chewieController.pause();
                              }
                            }
                          },
                          child: Chewie(controller: _chewieController),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            success: (value) => Column(children: value.videoForStudents.map((e) => Text(e.fileName)).toList()),
          ),
        ),
      ),
    );
  }
}

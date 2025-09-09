import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoadingCustom extends StatefulWidget {
  final double? paddingTop;
  const LoadingCustom({super.key, this.paddingTop});

  @override
  State<LoadingCustom> createState() => _LoadingCustomState();
}

class _LoadingCustomState extends State<LoadingCustom> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(Pictures.loading)
      ..initialize().then((_) {
        _controller.setLooping(true); // 🔁 Включаем зацикливание
        _controller.play(); // ▶ Автозапуск
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop ?? 0),
      child: Center(
        child: _controller.value.isInitialized
            ? SizedBox(
                width: 100,
                height: 100,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: ClipRRect(borderRadius: BorderRadius.circular(90), child: VideoPlayer(_controller)),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}

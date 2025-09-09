import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ErrorCustom extends StatefulWidget {
  final double? paddingTop;
  final String textError;
  final VoidCallback? repeat;
  const ErrorCustom({super.key, this.paddingTop, this.textError = '', this.repeat});

  @override
  State<ErrorCustom> createState() => _ErrorCustomState();
}

class _ErrorCustomState extends State<ErrorCustom> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(Pictures.error)
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
      padding: EdgeInsets.only(top: widget.paddingTop ?? MediaQuery.of(context).size.height / 4),
      child: Center(
        child: _controller.value.isInitialized
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: ClipRRect(borderRadius: BorderRadius.circular(12), child: VideoPlayer(_controller)),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.textError,
                      style: AppStyles.medium14s.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    if (widget.repeat != null)
                      CustomButton(
                        verticalPadding: 8,
                        backgroundColor: Color(0xFF0A6EFA),
                        title: 'Повторить',
                        textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                        borderColor: Color(0xFF0A6EFA),
                        borderRadius: 46,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff0064D6).withOpacity(0.25),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(
                              0.0,
                              7.0,
                            ),
                          ),
                        ],
                        onPressed: widget.repeat,
                      ),
                  ],
                ),
              )
            : SizedBox(),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class UpAnimation extends StatefulWidget {
  final int delay;
  final Widget child;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final int milSecDuration;
  final bool withFadeTransition;
  final AnimationController? controller;
  const UpAnimation({
    super.key,
    required this.delay,
    required this.child,
    required this.begin,
    required this.end,
    required this.curve,
    required this.milSecDuration,
    this.withFadeTransition = true,
    this.controller,
  });

  @override
  State<UpAnimation> createState() => _UpAnimationState();
}

class _UpAnimationState extends State<UpAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> offsetAnimation;
  Timer? _timer;
  // late final AnimationController _scaleController = AnimationController(
  //   duration: const Duration(seconds: 1),
  //   vsync: this,
  // );
  // late final Animation<double> _scaleAnimation = CurvedAnimation(
  //   parent: _scaleController,
  //   curve: Curves.fastOutSlowIn,
  // );

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ??
        AnimationController(
          duration: Duration(milliseconds: widget.milSecDuration),
          vsync: this,
        );

    offsetAnimation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    if (widget.delay == 0) {
      _controller.forward();
      // _scaleController.forward();
    } else {
      _timer = Timer(Duration(seconds: widget.delay), () {
        _controller.forward();
        // _scaleController.forward();
      });
    }
    // _controller.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.withFadeTransition
        ? FadeTransition(
            opacity: _controller,
            child: SlideTransition(position: offsetAnimation, child: widget.child),
          )
        : SlideTransition(position: offsetAnimation, child: widget.child);
  }
}

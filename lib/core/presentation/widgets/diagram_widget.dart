import 'dart:math' as math;
import 'package:flutter/material.dart';

class DiagramWidget extends StatelessWidget {
  const DiagramWidget({
    super.key,
    required this.percent, // 0.0 … 1.0
    this.width = 220,
    this.strokeWidth = 18,
    this.gradientColors = const [Color(0xFF1E7A59), Color(0xFF6EF8A6)],
    this.trackColor = const Color(0xFFE7EEFF),
    this.animationDuration = const Duration(milliseconds: 900),
    this.curve = Curves.easeOutCubic,
    this.centerBuilder,
  });

  /// Значение в долях (0.0…1.0)
  final double percent;

  /// Ширина гейджа (высота возьмётся автоматически = width/2)
  final double width;

  /// Толщина дуги
  final double strokeWidth;

  /// Градиент прогресса (слева -> справа)
  final List<Color> gradientColors;

  /// Цвет трека (фоновой дуги)
  final Color trackColor;

  /// Настройки анимации
  final Duration animationDuration;
  final Curve curve;

  /// Кастомная разметка по центру (если нужно)
  /// В билдер приходит текущее анимированное значение (0.0…1.0)
  final Widget Function(BuildContext context, double animatedPercent)? centerBuilder;

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0.0, 1.0);
    return SizedBox(
      width: width,
      // полукруг → высота в 2 раза меньше ширины
      height: width / 2,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: clamped),
        duration: animationDuration,
        curve: curve,
        builder: (context, value, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: _GaugePainter(
                  progress: value,
                  strokeWidth: strokeWidth,
                  gradientColors: gradientColors,
                  trackColor: trackColor,
                ),
              ),
              // Контент в центре
              Center(
                child: centerBuilder?.call(context, value) ?? _DefaultCenter(percent: value, baseWidth: width),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.progress,
    required this.strokeWidth,
    required this.gradientColors,
    required this.trackColor,
  });

  final double progress; // 0.0…1.0
  final double strokeWidth;
  final List<Color> gradientColors;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Центр окружности — на нижней середине, чтобы рисовать верхнюю половину круга
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2 - strokeWidth / 2;
    final arcRect = Rect.fromCircle(center: center, radius: radius);

    // Трек
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(arcRect, math.pi, math.pi, false, trackPaint);

    // Прогресс
    if (progress > 0) {
      final sweep = math.pi * progress;
      final progressPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt
        // SweepGradient вдоль дуги, от левого края (π) до текущего угла
        ..shader = SweepGradient(
          startAngle: math.pi,
          endAngle: math.pi + sweep,
          colors: gradientColors,
          tileMode: TileMode.clamp,
        ).createShader(arcRect);

      canvas.drawArc(arcRect, math.pi, sweep, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GaugePainter old) {
    return old.progress != progress ||
        old.strokeWidth != strokeWidth ||
        old.trackColor != trackColor ||
        old.gradientColors != gradientColors;
  }
}

class _DefaultCenter extends StatelessWidget {
  const _DefaultCenter({required this.percent, required this.baseWidth});

  final double percent;
  final double baseWidth;

  @override
  Widget build(BuildContext context) {
    final value = (percent * 100).round();
    // Подбираем размер шрифта от ширины виджета
    final fontSize = baseWidth * 0.18; // ~18% ширины

    return Text(
      '$value %',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF233163),
        letterSpacing: 0.5,
      ),
    );
  }
}

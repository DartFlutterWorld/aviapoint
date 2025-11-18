import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_colors.dart';

/// Виджет, который ограничивает максимальную ширину контента на вебе
/// и центрирует его на больших экранах
class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final Color? backgroundColor;

  const MaxWidthContainer({
    super.key,
    required this.child,
    this.maxWidth = 428.0, // iPhone 13 Pro Max ширина
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // На мобильных устройствах не ограничиваем ширину
    if (!kIsWeb) {
      return child;
    }

    return Container(
      color: backgroundColor ?? AppColors.background,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}

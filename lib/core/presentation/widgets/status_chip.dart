import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

/// Универсальный чип для отображения статуса
/// Основан на дизайне чипа Лизинга из маркета
/// Позволяет контролировать отступы от текста внутри
class StatusChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final TextStyle? textStyle;
  final double? height;

  const StatusChip({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.padding,
    this.borderRadius = 12,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget chip = Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          text,
          style: textStyle ?? AppStyles.regular12s.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (height != null) {
      return SizedBox(height: height, child: chip);
    }

    return chip;
  }
}

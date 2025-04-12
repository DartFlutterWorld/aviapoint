import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Настраиваемая кнопка.
class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final TextStyle textStyle;
  final bool disabled;
  final Color borderColor;
  final double verticalPadding;
  final double borderRadius;
  final double borderWidth;
  final List<Color>? gradientBackgroundColor;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    required this.textStyle,
    this.onPressed,
    this.disabled = false,
    required this.borderColor,
    this.verticalPadding = 12,
    this.borderRadius = 12,
    this.borderWidth = 2,
    this.gradientBackgroundColor,
    this.boxShadow = const [
      BoxShadow(
        color: Color(0xffCFBAE2),
        blurRadius: 5,
        spreadRadius: 0,
        offset: Offset(
          0.0,
          4.0,
        ),
      ),
    ],
  }) : super(key: key);

  List<Color>? disableColors(List<Color>? gradientBackgroundColor) {
    dynamic opacity;
    if (gradientBackgroundColor != null) {
      final opacity1 = gradientBackgroundColor.first.withValues(alpha: 0.6);
      final opacity2 = gradientBackgroundColor.last.withValues(alpha: 0.6);

      opacity = [opacity1, opacity2];
    }

    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   color: Colors.transparent,
    //   child: InkWell(
    //     onTap: disabled ? null : onTap,
    //     splashColor: Colors.blue.withOpacity(0.3), // Цвет эффекта
    //     highlightColor: Colors.blue.withOpacity(0.1), // Цвет подсветки
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: verticalPadding),
    //       decoration: BoxDecoration(
    //           // color: backgroundColor,
    //           borderRadius: BorderRadius.circular(
    //             borderRadius,
    //           ),
    //           border: Border.all(
    //             color: borderColor,
    //             width: borderWidth,
    //           ),
    //           gradient: backgroundColor != null
    //               ? null
    //               : LinearGradient(
    //                   begin: Alignment.topLeft,
    //                   end: Alignment.bottomRight,
    //                   colors: disabled ? disableColors(gradientBackgroundColor) ?? [] : gradientBackgroundColor ?? <Color>[],
    //                 ),
    //           boxShadow: boxShadow),
    //       child: Center(
    //         child: AutoSizeText(
    //           title,
    //           style: disabled ? textStyle.copyWith(color: textStyle.color) : textStyle,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.green,
          side: BorderSide(color: borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          // Настройки эффекта:
          overlayColor: Colors.green.withOpacity(0.1),
          splashFactory: InkRipple.splashFactory, // Используем стандартный ripple-эффект
        ),
        child: AutoSizeText(title, style: disabled ? textStyle.copyWith(color: textStyle.color) : textStyle),
      ),
    );
  }
}

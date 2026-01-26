import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final String? leftSvg;
  final String? rightSvg;

  const CustomButton({
    super.key,
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
    this.boxShadow = const [BoxShadow(color: Color(0xff104A91), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 4.0))],
    this.leftSvg,
    this.rightSvg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: disabled ? backgroundColor?.withOpacity(0.5) : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              if (leftSvg != null)
                Opacity(
                  opacity: disabled ? 0.5 : 1,
                  child: SvgPicture.asset(leftSvg!, height: 20.h),
                ),
              Text(title, style: disabled ? textStyle.copyWith(color: textStyle.color?.withOpacity(0.5)) : textStyle),
              if (rightSvg != null)
                Opacity(
                  opacity: disabled ? 0.5 : 1,
                  child: SvgPicture.asset(rightSvg!, height: 20.h),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  final String? icon;
  final IconData? iconData;
  final String text;
  final Color activeColor;
  final Color textColor;
  final void Function() onPressed;
  final bool isActive;

  const BottomBarItem({
    super.key,
    this.icon,
    this.iconData,
    required this.text,
    required this.activeColor,
    required this.textColor,
    required this.onPressed,
    required this.isActive,
  }) : assert(icon != null || iconData != null, 'Either icon or iconData must be provided');

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: isWeb 
            ? const EdgeInsets.symmetric(vertical: 6, horizontal: 6)
            : EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(isWeb ? 10 : 10.r),
        ),
        child: isWeb
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon != null
                      ? SvgPicture.asset(icon!, height: 32, width: 32, colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn))
                      : Icon(iconData!, size: 32, color: textColor),
                  const SizedBox(width: 13),
                  Text(
                    text,
                    style: AppStyles.medium10s.copyWith(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? SvgPicture.asset(icon!, height: 20.sp, width: 20.sp, colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn))
                      : Icon(iconData!, size: 20.sp, color: textColor),
                  SizedBox(height: 4.h),
                  Text(
                    text,
                    style: AppStyles.medium10s.copyWith(color: textColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}

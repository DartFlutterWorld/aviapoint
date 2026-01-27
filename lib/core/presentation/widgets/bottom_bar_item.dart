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
  final bool? useVerticalLayout; // Если true, использует Column (иконка сверху, текст снизу)

  const BottomBarItem({
    super.key,
    this.icon,
    this.iconData,
    required this.text,
    required this.activeColor,
    required this.textColor,
    required this.onPressed,
    required this.isActive,
    this.useVerticalLayout,
  }) : assert(icon != null || iconData != null, 'Either icon or iconData must be provided');

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;
    // Если useVerticalLayout явно указан, используем его, иначе определяем автоматически
    final shouldUseVertical = useVerticalLayout ?? (!isWeb);
    
    // Для веба в портрете на мобилке используем вертикальную компоновку (как в приложении)
    final isWebMobilePortrait = isWeb && 
        MediaQuery.of(context).size.width < 600 && 
        MediaQuery.of(context).orientation == Orientation.portrait;
    
    final useVertical = shouldUseVertical || isWebMobilePortrait;
    
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
        child: useVertical
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? SvgPicture.asset(
                          icon!, 
                          height: isWebMobilePortrait ? 20.0 : 20.sp, 
                          width: isWebMobilePortrait ? 20.0 : 20.sp, 
                          colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn))
                      : Icon(iconData!, size: isWebMobilePortrait ? 20.0 : 20.sp, color: textColor),
                  SizedBox(height: isWebMobilePortrait ? 4.0 : 4.h),
                  Text(
                    text,
                    style: AppStyles.medium10s.copyWith(color: textColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : Row(
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
              ),
      ),
    );
  }
}

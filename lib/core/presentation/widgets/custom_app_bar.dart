import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final List<Widget> actions;
  final bool withBack;
  final VoidCallback? onTap;
  final TextAlign titleTextAlign;
  final bool withLogo;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
    this.actions = const [],
    this.withBack = true,
    this.titleTextAlign = TextAlign.start,
    this.onTap,
    this.withLogo = false,
    this.backgroundColor,
    this.elevation = 3,
    this.shadowColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  void _pop(BuildContext context) {
    AutoRouter.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: withBack
          ? GestureDetector(
              onTap: onTap ?? () => _pop(context),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      'assets/svg/back_new.svg',
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary100p,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text('Назад', style: AppStyles.appbarTitle.copyWith(color: AppColors.mainSolid)),
                  ],
                ),
              ),
            )
          : GestureDetector(
              onTap: onTap,
            ),
      leadingWidth: 90.r,
      iconTheme: const IconThemeData(
        color: AppColors.bgViolet,
      ),
      centerTitle: true,
      backgroundColor: kIsWeb ? AppColors.newbg : backgroundColor ?? AppColors.white,
      elevation: elevation,
      shadowColor: kIsWeb ? null : shadowColor ?? const Color(0xFFA8A39C).withValues(alpha: 0.12),
      title: withLogo
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svg/newlogo.svg'),
                // const SizedBox(width: 4),
                // SvgPicture.asset('assets/svg/logo_price_seed.svg'),
              ],
            )
          : Text(
              title,
              style: AppStyles.appbarTitle.copyWith(color: AppColors.netural100p),
              maxLines: 2,
              textAlign: titleTextAlign,
            ),
      actions: actions,
    );
  }
}

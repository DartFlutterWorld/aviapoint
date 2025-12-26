import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
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
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.actions = const [],
    this.withBack = true,
    this.titleTextAlign = TextAlign.start,
    this.onTap,
    this.withLogo = false,
    this.backgroundColor,
    this.elevation = 1,
    this.shadowColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  // void _pop(BuildContext context) {
  //   AutoRouter.of(context).maybePop();
  // }

  void _pop(BuildContext context) async {
    final bool result = await AutoRouter.of(context).maybePop();

    if (!result && context.mounted) {
      AutoRouter.of(context).push(const BaseRoute(children: [MainNavigationRoute()]));
    }
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
                    SizedBox(width: 12.w),
                    SvgPicture.asset(Pictures.arrowCircleLeft, height: 24),
                  ],
                ),
              ),
            )
          : SizedBox(),
      leadingWidth: 60.r,
      centerTitle: true,
      backgroundColor: AppColors.backgroundAppBar,
      elevation: elevation,
      shadowColor: kIsWeb ? null : shadowColor ?? const Color(0xFFA8A39C).withValues(alpha: 0.12),
      title: withLogo
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [SvgPicture.asset(Pictures.logoTitle)],
            )
          : Text(
              title,
              style: TextStyle(
                color: Color(0xFF223B76),
                fontSize: 14.sp,
                fontFamily: 'Geologica-Medium',
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: titleTextAlign,
            ),
      actions: actions,
    );
  }
}

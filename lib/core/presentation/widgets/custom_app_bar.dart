import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
  final bool withProfile;

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
    this.withProfile = false,
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
      actions: [
        ...actions,
        if (withProfile)
          _ProfileButton(),
      ],
    );
  }
}

class _ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: true).isAuthenticated;

    if (!isAuthenticated) {
      return IconButton(
        icon: SvgPicture.asset(
          Pictures.profileNavbar,
          height: 24,
          colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
        ),
        onPressed: () => AutoRouter.of(context).push(const ProfileNavigationRoute()),
        tooltip: 'Профиль',
      );
    }

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final avatarUrl = state.maybeWhen(
          success: (profile) => profile.avatarUrl,
          orElse: () => null,
        );

        final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

        return IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: ClipOval(
            child: imageUrl != null && imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                    cacheManager: getIt<DefaultCacheManager>(),
                    cacheKey: avatarUrl,
                    placeholder: (context, url) => SvgPicture.asset(
                      Pictures.profileNavbar,
                      height: 24,
                      colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                    ),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      Pictures.profileNavbar,
                      height: 24,
                      colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                    ),
                  )
                : SvgPicture.asset(
                    Pictures.profileNavbar,
                    height: 24,
                    colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                  ),
          ),
          onPressed: () => AutoRouter.of(context).push(const ProfileNavigationRoute()),
          tooltip: 'Профиль',
        );
      },
    );
  }
}

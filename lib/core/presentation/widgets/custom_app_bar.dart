import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final PreferredSizeWidget? bottom;

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
    this.bottom,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));
  }

  // void _pop(BuildContext context) {
  //   AutoRouter.of(context).maybePop();
  // }

  void _pop(BuildContext context) async {
    final bool result = await AutoRouter.of(context).maybePop();

    if (!result && context.mounted) {
      // Профиль мог быть открыт через setActiveIndex(6) без push — тогда переключаем на главную вкладку
      try {
        final tabsRouter = AutoTabsRouter.of(context);
        tabsRouter.setActiveIndex(0); // 0 — Main в BaseScreen.routes
      } catch (_) {
        final rootContext = navigatorKey.currentContext;
        if (rootContext != null && rootContext.mounted) {
          try {
            final tabsRouter = AutoTabsRouter.of(rootContext);
            tabsRouter.setActiveIndex(0);
          } catch (_) {
            AutoRouter.of(context).push(const BaseRoute(children: [MainNavigationRoute()]));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = 26.0;
    return AppBar(
      toolbarHeight: height,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(size: iconSize),
      actionsIconTheme: IconThemeData(size: iconSize),
      leading: withBack
          ? GestureDetector(
              onTap: onTap ?? () => _pop(context),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    SvgPicture.asset(Pictures.arrowCircleLeft, height: iconSize, width: iconSize),
                  ],
                ),
              ),
            )
          : SizedBox(),
      leadingWidth: 60,
      centerTitle: true,
      backgroundColor: AppColors.backgroundAppBar,
      elevation: elevation,
      shadowColor: kIsWeb ? null : shadowColor ?? const Color(0xFFA8A39C).withValues(alpha: 0.12),
      title: withLogo
          ? Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [SvgPicture.asset(Pictures.logoTitle, height: 40)])
          : Text(
              title,
              style: AppStyles.bold20s.copyWith(color: const Color(0xFF223B76), fontFamily: 'Geologica-Medium'),
              maxLines: 2,
              textAlign: titleTextAlign,
              overflow: TextOverflow.ellipsis,
            ),
      actions: [...actions, if (withProfile) _ProfileButton()],
      bottom: bottom,
    );
  }
}

class _ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: true).isAuthenticated;
    final iconSize = 28.0;

    if (!isAuthenticated) {
      // Не авторизован: всегда показываем кнопку профиля, при нажатии — bottom sheet авторизации
      return IconButton(
        constraints: const BoxConstraints(),
        iconSize: iconSize,
        icon: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
        onPressed: () => showLogin(context),
        tooltip: 'Профиль',
      );
    }

    // Авторизован: показываем аватар и ведём в профиль (как отдельную вкладку)
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final avatarUrl = state.maybeWhen(success: (profile) => profile.avatarUrl, orElse: () => null);

        final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

        return IconButton(
          constraints: BoxConstraints(),
          iconSize: iconSize,
          icon: ClipOval(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? NetworkImageWidget(
                      imageUrl: imageUrl,
                      width: iconSize,
                      height: iconSize,
                      fit: BoxFit.cover,
                      placeholder: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
                      errorWidget: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
                    )
                  : SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
            ),
          ),
          onPressed: () {
            try {
              // Сначала пробуем найти TabsRouter из текущего контекста (страница внутри BaseScreen)
              final tabsRouter = AutoTabsRouter.of(context);
              // Индекс профиля в BaseScreen.routes:
              // 0-main,1-learning,2-on-the-way,3-work,4-market,5-journal,6-profile
              tabsRouter.setActiveIndex(6);
            } catch (_) {
              // Если по какой-то причине TabsRouter не найден в локальном контексте,
              // пробуем обратиться через глобальный navigatorKey и, если нужно, просто навигируемся в профиль.
              final rootContext = navigatorKey.currentContext;
              if (rootContext != null) {
                try {
                  final tabsRouter = AutoTabsRouter.of(rootContext);
                  tabsRouter.setActiveIndex(6);
                } catch (_) {
                  AutoRouter.of(rootContext).navigate(const ProfileNavigationRoute());
                }
              }
            }
          },
          tooltip: 'Профиль',
        );
      },
    );
  }
}

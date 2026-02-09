import 'package:aviapoint/core/presentation/bloc/internet_connection_bloc.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatefulWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool _hasShownSnackbar = false;

  void _showNoInternetSnackbar() {
    final navigatorContext = navigatorKey.currentContext;
    if (navigatorContext == null || !mounted) return;

    ScaffoldMessenger.of(navigatorContext).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi_off, color: Colors.white, size: 20.0),
            SizedBox(width: 8),
            Expanded(
              child: Text('Нет подключения к интернету', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(days: 1), // Показываем до восстановления подключения
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showConnectionRestored() {
    final navigatorContext = navigatorKey.currentContext;
    if (navigatorContext == null || !mounted) return;

    ScaffoldMessenger.of(navigatorContext).hideCurrentSnackBar();
    ScaffoldMessenger.of(navigatorContext).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi, color: Colors.white, size: 20.0),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Подключение к интернету восстановлено',
                style: AppStyles.regular14s.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectionBloc, InternetConnectionState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          connected: () {
            if (_hasShownSnackbar) {
              _showConnectionRestored();
              _hasShownSnackbar = false;
            }
          },
          disconnected: () {
            if (!_hasShownSnackbar) {
              _showNoInternetSnackbar();
              _hasShownSnackbar = true;
            }
          },
        );
      },
      child: widget.child,
    );
  }
}

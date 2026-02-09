import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:upgrader/upgrader.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Показываем bottom sheet с предложением обновить приложение
Future<void> showUpdateRequiredBottomSheet(BuildContext context, {Upgrader? upgrader}) async {
  // Получаем URL стора (используем известные URL)
  final storeUrl = Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=ru.dartflutter.aviapoint' : 'https://apps.apple.com/app/id6757299344';

  if (Platform.isIOS) {
    await showCupertinoModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.black54,
      topRadius: const Radius.circular(20),
      builder: (context) => UpdateRequiredBottomSheet(storeUrl: storeUrl),
    );
  } else {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      barrierColor: Colors.black54,
      backgroundColor: AppColors.background,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => UpdateRequiredBottomSheet(storeUrl: storeUrl),
    );
  }
}

class UpdateRequiredBottomSheet extends StatelessWidget {
  final String storeUrl;

  const UpdateRequiredBottomSheet({super.key, required this.storeUrl});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return WillPopScope(
      onWillPop: () async => false, // блокируем кнопку \"назад\"
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Иконка стора
              _buildStoreIcon(isIOS),
              SizedBox(height: 24),

              // Заголовок
              Text(
                'Требуется обновление',
                style: AppStyles.bold20s.copyWith(color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Текст
              Text(
                'Для продолжения работы обновите приложение до последней версии. Мы добавили новые возможности и улучшения.',
                style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),

              // Кнопка обновления
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _openStore(storeUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary100p,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isIOS ? 'Открыть App Store' : 'Открыть Google Play', style: AppStyles.regular14s.copyWith(color: Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreIcon(bool isIOS) {
    if (isIOS) {
      // Иконка App Store
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.apple, color: Colors.white, size: 40.0),
      );
    } else {
      // Иконка Google Play
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.strokeForDarkArea, width: 1),
        ),
        child: Icon(Icons.android, color: Colors.green, size: 40.0),
      );
    }
  }

  Future<void> _openStore(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Ошибка при открытии стора: $e');
    }
  }
}

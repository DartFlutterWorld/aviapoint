import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
import 'package:aviapoint/core/utils/device_utils.dart';

class AppStyles {
  /// Приватный метод для масштабирования размера шрифта в зависимости от типа устройства
  /// iPhone: без изменений (1.0)
  /// Планшет: +20% (1.2)
  /// Веб: +30% (1.3)
  static double _scaleFontSize(double baseSize) {
    final scaleFactor = getTextScaleFactor();
    return baseSize * scaleFactor;
  }

  /// Получает коэффициент масштабирования текста в зависимости от типа устройства
  /// iPhone: 1.0 (без изменений)
  /// Планшет: 1.2 (+20%)
  /// Веб: 1.3 (+30%)
  static double getTextScaleFactor() {
    if (kIsWeb) {
      return 1.3; // Веб: +30%
    }
    if (DeviceUtils.isTabletSync()) {
      return 2; // Планшет: x2
    }
    return 1.0; // iPhone: без изменений
  }

  // Методы вместо static констант, чтобы стили пересчитывались при каждом обращении
  // Все размеры автоматически масштабируются в зависимости от типа устройства
  static TextStyle get button => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(20), height: 1);
  static TextStyle get bigButtonCulture => TextStyle(fontWeight: FontWeight.w600, fontSize: _scaleFontSize(18), height: 1);

  static TextStyle get titleMidle => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(17), height: 22.44 / 17, color: AppColors.netural100p, letterSpacing: 0);

  static TextStyle get medium8s => TextStyle(fontWeight: FontWeight.w500, fontSize: _scaleFontSize(8), height: 1);
  static TextStyle get medium10s => TextStyle(fontWeight: FontWeight.w500, fontSize: _scaleFontSize(10), height: 1);
  static TextStyle get medium14s => TextStyle(fontWeight: FontWeight.w500, fontSize: _scaleFontSize(14), height: 1);
  static TextStyle get bold24s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(24), height: 1);
  static TextStyle get bold20s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(20), height: 1);
  static TextStyle get bold17s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(17), height: 1);
  static TextStyle get bold18s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(18), height: 1);
  static TextStyle get bold16s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(16), height: 1);
  static TextStyle get bold15s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(15), height: 1);
  static TextStyle get bold12s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(12), height: 1);
  static TextStyle get bold14s => TextStyle(fontWeight: FontWeight.w700, fontSize: _scaleFontSize(14), height: 1);
  static TextStyle get extraBold => TextStyle(fontWeight: FontWeight.w900, fontSize: _scaleFontSize(30), height: 1);
  static TextStyle get regular15s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(15), height: 1);
  static TextStyle get regular12s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(12), height: 1);
  static TextStyle get regular10s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(10), height: 1);
  static TextStyle get regular13s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(13), height: 1);
  static TextStyle get regular14s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(14), height: 1);
  static TextStyle get regular18s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(18), height: 1);
  static TextStyle get mediumItalic13s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(13), height: 1, fontStyle: FontStyle.italic);
  static TextStyle get mediumItalic12s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(12), height: 1, fontStyle: FontStyle.italic);
  static TextStyle get light10s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(10), height: 1);
  static TextStyle get light12s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(12), height: 1);
  static TextStyle get light14s => TextStyle(fontWeight: FontWeight.w400, fontSize: _scaleFontSize(14), height: 1);
  static TextStyle get semibpld14s => TextStyle(fontWeight: FontWeight.w600, fontSize: _scaleFontSize(14), height: 1);

  /// Универсальный метод для адаптивного размера текста на основе реальных размеров экрана
  /// Использует ширину экрана как базу для масштабирования (не зависит от ScreenUtil)
  /// baseSize - базовый размер в пикселях для дизайна шириной 375px (iPhone стандарт)
  static double adaptiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Базовый дизайн: 375px (iPhone стандарт)
    // Масштабируем относительно реальной ширины экрана
    final scaleFactor = screenWidth / 375.0;
    return baseSize * scaleFactor;
  }

  /// Создает адаптивный TextStyle на основе реальных размеров экрана
  static TextStyle adaptiveTextStyle(BuildContext context, TextStyle baseStyle, {double? baseSize}) {
    final fontSize = baseSize != null ? adaptiveFontSize(context, baseSize) : (baseStyle.fontSize ?? 14) * (MediaQuery.of(context).size.width / 375.0);
    return baseStyle.copyWith(fontSize: fontSize);
  }

  /// Универсальный метод для адаптивного размера изображения
  /// Вычисляет размер на основе процента от ширины/высоты экрана
  /// heightPercent - процент от высоты экрана (например, 0.55 = 55%)
  /// widthPercent - процент от ширины экрана (например, 0.4 = 40%)
  /// Возвращает большее значение для лучшего отображения в обеих ориентациях
  static double adaptiveImageSize(BuildContext context, {double heightPercent = 0.55, double widthPercent = 0.4}) {
    final screenSize = MediaQuery.of(context).size;
    final imageSizeFromHeight = screenSize.height * heightPercent;
    final imageSizeFromWidth = screenSize.width * widthPercent;
    // Берем большее значение для лучшего отображения
    return imageSizeFromHeight > imageSizeFromWidth ? imageSizeFromHeight : imageSizeFromWidth;
  }

  /// Адаптивный padding на основе реальных размеров экрана
  /// basePadding - базовый размер в пикселях для дизайна шириной 375px
  /// Использует ширину экрана для горизонтальных отступов
  static double adaptivePadding(BuildContext context, double basePadding) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Масштабируем относительно ширины экрана
    return basePadding * (screenWidth / 375.0);
  }

  /// Адаптивный вертикальный spacing на основе реальных размеров экрана
  /// baseSpacing - базовый размер в пикселях для дизайна
  /// Использует минимальное значение из ширины и высоты для баланса в обеих ориентациях
  static double adaptiveVerticalSpacing(BuildContext context, double baseSpacing) {
    final screenSize = MediaQuery.of(context).size;
    // Используем минимальное значение для одинаковых отступов в обеих ориентациях
    final minDimension = screenSize.width < screenSize.height ? screenSize.width : screenSize.height;
    // Базовый дизайн: 375px (минимальная сторона в портретной ориентации)
    return baseSpacing * (minDimension / 375.0);
  }

  /// Горизонтальный отступ (фиксированный 8px)
  /// Использует константу AppSpacing.horizontal
  /// Не масштабируется - всегда 8px для единообразия на всех экранах
  static double adaptiveHorizontalPadding(BuildContext context) {
    return AppSpacing.horizontal;
  }

  /// Вертикальный отступ между секциями (фиксированный 16px)
  /// Использует константу AppSpacing.section
  /// Не масштабируется - всегда 16px для единообразия на всех экранах
  static double adaptiveSectionSpacing(BuildContext context) {
    return AppSpacing.section;
  }

  /// Адаптивный размер иконки на основе реальных размеров экрана
  /// baseSize - базовый размер в пикселях для дизайна шириной 375px
  /// Использует минимальное значение из ширины и высоты для круглых иконок
  static double adaptiveIconSize(BuildContext context, double baseSize) {
    final screenSize = MediaQuery.of(context).size;
    // Используем минимальное значение для одинаковых размеров в обеих ориентациях
    final minDimension = screenSize.width < screenSize.height ? screenSize.width : screenSize.height;
    // Базовый дизайн: 375px (минимальная сторона в портретной ориентации)
    return baseSize * (minDimension / 375.0);
  }
}

/// Расширение для TextStyle для автоматического масштабирования текста
/// в зависимости от типа устройства (iPhone/планшет/веб)
extension TextStyleDeviceScale on TextStyle {
  /// Масштабирует размер шрифта в зависимости от типа устройства
  /// iPhone: без изменений (1.0)
  /// Планшет: +20% (1.2)
  /// Веб: +30% (1.3)
  TextStyle scaled() {
    final scaleFactor = AppStyles.getTextScaleFactor();
    if (scaleFactor == 1.0) {
      return this; // Не создаем новый объект, если масштабирование не нужно
    }
    return copyWith(fontSize: (fontSize ?? 14) * scaleFactor);
  }
}

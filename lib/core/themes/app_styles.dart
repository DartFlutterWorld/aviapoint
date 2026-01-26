import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';

class AppStyles {
  // Методы вместо static констант, чтобы стили пересчитывались при каждом обращении
  static TextStyle get button => TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp, height: 1);
  static TextStyle get bigButtonCulture => TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp, height: 1);

  static TextStyle get titleMidle => TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp, height: 22.44 / 17, color: AppColors.netural100p, letterSpacing: 0);

  static TextStyle get medium8s => TextStyle(fontWeight: FontWeight.w500, fontSize: 8.sp, height: 1);
  static TextStyle get medium10s => TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp, height: 1);
  static TextStyle get medium14s => TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, height: 1);
  static TextStyle get bold20s => TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp, height: 1);
  static TextStyle get bold17s => TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp, height: 1);
  static TextStyle get bold18s => TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp, height: 1);
  static TextStyle get bold16s => TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp, height: 1);
  static TextStyle get bold15s => TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp, height: 1);
  static TextStyle get bold12s => TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp, height: 1);
  static TextStyle get bold14s => TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, height: 1);
  static TextStyle get extraBold => TextStyle(fontWeight: FontWeight.w900, fontSize: 30.sp, height: 1);
  static TextStyle get regular15s => TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp, height: 1);
  static TextStyle get regular12s => TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, height: 1);
  static TextStyle get regular10s => TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, height: 1);
  static TextStyle get regular13s => TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp, height: 1);
  static TextStyle get regular14s => TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, height: 1);
  static TextStyle get mediumItalic13s => TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp, height: 1, fontStyle: FontStyle.italic);
  static TextStyle get mediumItalic12s => TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, height: 1, fontStyle: FontStyle.italic);
  static TextStyle get light10s => TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, height: 1);
  static TextStyle get light12s => TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, height: 1);
  static TextStyle get light14s => TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, height: 1);
  static TextStyle get semibpld14s => TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, height: 1);

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

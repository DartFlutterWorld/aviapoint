/// Константы для отступов и промежутков в приложении
///
/// Эти значения используются как базовые для адаптивных методов
/// в AppStyles.adaptivePadding() и AppStyles.adaptiveVerticalSpacing()
class AppSpacing {
  AppSpacing._();

  /// Горизонтальный отступ по умолчанию (8px)
  /// Используется для отступов слева и справа от контента
  static const double horizontal = 8.0;

  /// Вертикальный отступ между секциями (16px)
  /// Используется для промежутков между основными секциями контента
  static const double section = 16.0;

  /// Малый отступ (4px)
  static const double small = 4.0;

  /// Средний отступ (12px)
  static const double medium = 12.0;

  /// Большой отступ (24px)
  static const double large = 24.0;

  /// Очень большой отступ (32px)
  static const double xLarge = 32.0;
}

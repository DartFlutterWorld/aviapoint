/// Типы подписок
enum SubscriptionType {
  /// Месячная подписка
  monthly('monthly', 30),

  /// Квартальная подписка
  quarterly('quarterly', 90),

  /// Годовая подписка
  yearly('yearly', 365);

  final String value;
  final int periodDays;

  const SubscriptionType(this.value, this.periodDays);
}

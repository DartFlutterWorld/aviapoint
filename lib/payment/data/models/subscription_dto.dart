import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
abstract class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'payment_id') required String paymentId, // required как на бэкенде
    @JsonKey(name: 'subscription_type_id') required int subscriptionTypeId, // required как на бэкенде
    @JsonKey(name: 'period_days') required int periodDays,
    @JsonKey(name: 'start_date', fromJson: _dateTimeFromJson) required DateTime startDate,
    @JsonKey(name: 'end_date', fromJson: _dateTimeFromJson) required DateTime endDate,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson) required DateTime createdAt,
    required int amount, // Цена подписки из платежа (required как на бэкенде)
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);
}

/// Парсит DateTime из строки, объекта DateTime или Map (если приходит как объект из JSON)
DateTime _dateTimeFromJson(dynamic value) {
  if (value == null) {
    throw FormatException('DateTime cannot be null for required field');
  }

  if (value is String) {
    return DateTime.parse(value);
  } else if (value is DateTime) {
    return value;
  } else if (value is Map) {
    // Если DateTime приходит как объект из JSON (например, из БД без сериализации)
    // Пытаемся извлечь значение из разных возможных форматов
    if (value.containsKey('_seconds') || value.containsKey('seconds')) {
      // Timestamp формат (Firebase/Unix timestamp)
      final seconds = value['_seconds'] ?? value['seconds'] ?? value['_milliseconds'] ?? value['milliseconds'];
      if (seconds is int) {
        return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
      } else if (seconds is num) {
        return DateTime.fromMillisecondsSinceEpoch((seconds * 1000).toInt());
      }
    }
    // Если это ISO строка в Map
    if (value.containsKey('iso') && value['iso'] is String) {
      return DateTime.parse(value['iso'] as String);
    }
    // Если есть поля year, month, day и т.д.
    if (value.containsKey('year') && value.containsKey('month') && value.containsKey('day')) {
      return DateTime(
        value['year'] as int,
        value['month'] as int,
        value['day'] as int,
        value['hour'] as int? ?? 0,
        value['minute'] as int? ?? 0,
        value['second'] as int? ?? 0,
        value['millisecond'] as int? ?? 0,
      );
    }
  } else if (value is num) {
    // Unix timestamp в миллисекундах или секундах
    if (value > 1000000000000) {
      // Миллисекунды
      return DateTime.fromMillisecondsSinceEpoch(value.toInt());
    } else {
      // Секунды
      return DateTime.fromMillisecondsSinceEpoch((value * 1000).toInt());
    }
  }

  throw FormatException('Cannot parse DateTime from $value (type: ${value.runtimeType})');
}

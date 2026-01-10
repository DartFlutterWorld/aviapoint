import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_review_dto.freezed.dart';
part 'airport_review_dto.g.dart';

@freezed
abstract class AirportReviewDto with _$AirportReviewDto {
  const factory AirportReviewDto({
    required int id,
    @JsonKey(name: 'airport_code') required String airportCode,
    @JsonKey(name: 'reviewer_id') required int reviewerId,
    int? rating,
    String? comment,
    @JsonKey(name: 'photo_urls', fromJson: _photoUrlsFromJson) List<String>? photoUrls,
    @JsonKey(name: 'reply_to_review_id') int? replyToReviewId,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
    @JsonKey(name: 'reviewer_first_name') String? reviewerFirstName,
    @JsonKey(name: 'reviewer_last_name') String? reviewerLastName,
    @JsonKey(name: 'reviewer_avatar_url') String? reviewerAvatarUrl,
  }) = _AirportReviewDto;

  factory AirportReviewDto.fromJson(Map<String, dynamic> json) => _$AirportReviewDtoFromJson(json);
}

/// Парсит массив фотографий из JSON
List<String>? _photoUrlsFromJson(dynamic value) {
  if (value == null) return null;
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }
  return null;
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

/// Парсит nullable DateTime
DateTime? _dateTimeFromJsonNullable(dynamic value) {
  if (value == null) {
    return null;
  }
  return _dateTimeFromJson(value);
}

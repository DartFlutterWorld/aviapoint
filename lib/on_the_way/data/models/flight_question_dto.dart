import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_question_dto.freezed.dart';
part 'flight_question_dto.g.dart';

@freezed
abstract class FlightQuestionDto with _$FlightQuestionDto {
  const factory FlightQuestionDto({
    required int id,
    @JsonKey(name: 'flight_id') required int flightId,
    @JsonKey(name: 'author_id', fromJson: _intFromJsonNullable) int? authorId,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'answer_text') String? answerText,
    @JsonKey(name: 'answered_by_id', fromJson: _intFromJsonNullable) int? answeredById,
    @JsonKey(name: 'answered_at', fromJson: _dateTimeFromJsonNullable) DateTime? answeredAt,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
    @JsonKey(name: 'author_first_name') String? authorFirstName,
    @JsonKey(name: 'author_last_name') String? authorLastName,
    @JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,
    @JsonKey(name: 'answered_by_first_name') String? answeredByFirstName,
    @JsonKey(name: 'answered_by_last_name') String? answeredByLastName,
    @JsonKey(name: 'answered_by_avatar_url') String? answeredByAvatarUrl,
  }) = _FlightQuestionDto;

  factory FlightQuestionDto.fromJson(Map<String, dynamic> json) => _$FlightQuestionDtoFromJson(json);
}

/// Парсит DateTime из строки, объекта DateTime или Map
DateTime _dateTimeFromJson(dynamic value) {
  if (value == null) {
    throw FormatException('DateTime cannot be null for required field');
  }

  if (value is String) {
    return DateTime.parse(value);
  } else if (value is DateTime) {
    return value;
  } else if (value is Map) {
    if (value.containsKey('_seconds') || value.containsKey('seconds')) {
      final seconds = value['_seconds'] ?? value['seconds'] ?? value['_milliseconds'] ?? value['milliseconds'];
      if (seconds is int) {
        return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
      } else if (seconds is num) {
        return DateTime.fromMillisecondsSinceEpoch((seconds * 1000).toInt());
      }
    }
    if (value.containsKey('iso') && value['iso'] is String) {
      return DateTime.parse(value['iso'] as String);
    }
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
    if (value > 1000000000000) {
      return DateTime.fromMillisecondsSinceEpoch(value.toInt());
    } else {
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

/// Парсит nullable int
int? _intFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

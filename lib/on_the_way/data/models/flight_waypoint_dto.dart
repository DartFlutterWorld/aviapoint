import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_waypoint_dto.freezed.dart';
part 'flight_waypoint_dto.g.dart';

@freezed
abstract class FlightWaypointDto with _$FlightWaypointDto {
  const factory FlightWaypointDto({
    required int id,
    @JsonKey(name: 'flight_id') required int flightId,
    @JsonKey(name: 'airport_code') required String airportCode,
    @JsonKey(name: 'sequence_order') required int sequenceOrder,
    @JsonKey(name: 'arrival_time', fromJson: _dateTimeFromJsonNullable) DateTime? arrivalTime,
    @JsonKey(name: 'departure_time', fromJson: _dateTimeFromJsonNullable) DateTime? departureTime,
    String? comment,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    // Дополнительная информация об аэропорте
    @JsonKey(name: 'airport_name') String? airportName,
    @JsonKey(name: 'airport_city') String? airportCity,
    @JsonKey(name: 'airport_region') String? airportRegion,
    @JsonKey(name: 'airport_type') String? airportType,
    @JsonKey(name: 'airport_ident_ru') String? airportIdentRu,
  }) = _FlightWaypointDto;

  factory FlightWaypointDto.fromJson(Map<String, dynamic> json) => _$FlightWaypointDtoFromJson(json);
}

/// Парсит nullable DateTime
/// Аналогично реализации в flight_dto.dart - обрабатывает разные форматы
DateTime? _dateTimeFromJsonNullable(dynamic value) {
  if (value == null) {
    return null;
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

  return null;
}


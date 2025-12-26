import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_dto.freezed.dart';
part 'flight_dto.g.dart';

@freezed
abstract class FlightDto with _$FlightDto {
  const factory FlightDto({
    required int id,
    @JsonKey(name: 'pilot_id') required int pilotId,
    @JsonKey(name: 'departure_airport') required String departureAirport,
    @JsonKey(name: 'arrival_airport') required String arrivalAirport,
    // Дополнительная информация об аэропорте отправления
    @JsonKey(name: 'departure_airport_name') String? departureAirportName,
    @JsonKey(name: 'departure_airport_city') String? departureAirportCity,
    @JsonKey(name: 'departure_airport_region') String? departureAirportRegion,
    @JsonKey(name: 'departure_airport_type') String? departureAirportType,
    @JsonKey(name: 'departure_airport_ident_ru') String? departureAirportIdentRu,
    // Дополнительная информация об аэропорте прибытия
    @JsonKey(name: 'arrival_airport_name') String? arrivalAirportName,
    @JsonKey(name: 'arrival_airport_city') String? arrivalAirportCity,
    @JsonKey(name: 'arrival_airport_region') String? arrivalAirportRegion,
    @JsonKey(name: 'arrival_airport_type') String? arrivalAirportType,
    @JsonKey(name: 'arrival_airport_ident_ru') String? arrivalAirportIdentRu,
    @JsonKey(name: 'departure_date', fromJson: _dateTimeFromJson) required DateTime departureDate,
    @JsonKey(name: 'available_seats') required int availableSeats,
    @JsonKey(name: 'total_seats') int? totalSeats,
    @JsonKey(name: 'price_per_seat') required double pricePerSeat,
    @JsonKey(name: 'aircraft_type') String? aircraftType,
    String? description,
    String? status,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
    // Данные пилота (создателя полёта) - загружаются через JOIN в SQL
    @JsonKey(name: 'pilot_first_name') String? pilotFirstName,
    @JsonKey(name: 'pilot_last_name') String? pilotLastName,
    @JsonKey(name: 'pilot_avatar_url') String? pilotAvatarUrl,
    @JsonKey(name: 'pilot_average_rating', fromJson: _doubleFromJsonNullable) double? pilotAverageRating,
    // Фотографии полета
    @JsonKey(name: 'photos', fromJson: _photosFromJson) List<String>? photos,
  }) = _FlightDto;

  factory FlightDto.fromJson(Map<String, dynamic> json) => _$FlightDtoFromJson(json);
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

/// Парсит nullable double
double? _doubleFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

/// Парсит список фотографий из JSON
List<String>? _photosFromJson(dynamic value) {
  if (value == null) return null;
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }
  if (value is String) {
    // Если приходит строка с JSON массивом, пытаемся распарсить
    try {
      final decoded = jsonDecode(value);
      if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (e) {
      // Игнорируем ошибки парсинга
    }
  }
  return null;
}

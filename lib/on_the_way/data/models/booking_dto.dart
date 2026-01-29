import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_dto.freezed.dart';
part 'booking_dto.g.dart';

@freezed
abstract class BookingDto with _$BookingDto {
  const factory BookingDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(name: 'flight_id', fromJson: _intFromJson) required int flightId,
    @JsonKey(name: 'passenger_id', fromJson: _intFromJson) required int passengerId,
    @JsonKey(name: 'seats_count', fromJson: _intFromJson) required int seatsCount,
    @JsonKey(name: 'total_price', fromJson: _intFromJson) required int totalPrice,
    String? status,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
    // Данные пассажира (загружаются через JOIN в SQL)
    @JsonKey(name: 'passenger_first_name') String? passengerFirstName,
    @JsonKey(name: 'passenger_last_name') String? passengerLastName,
    @JsonKey(name: 'passenger_avatar_url') String? passengerAvatarUrl,
    @JsonKey(name: 'passenger_phone') String? passengerPhone,
    @JsonKey(name: 'passenger_email') String? passengerEmail,
    @JsonKey(name: 'passenger_telegram') String? passengerTelegram,
    @JsonKey(name: 'passenger_max') String? passengerMax,
    @JsonKey(name: 'passenger_average_rating', fromJson: _doubleFromJsonNullable) double? passengerAverageRating,
    @JsonKey(name: 'flight_departure_date', fromJson: _dateTimeFromJsonNullable) DateTime? flightDepartureDate,
    @JsonKey(name: 'flight_departure_airport') String? flightDepartureAirport,
    @JsonKey(name: 'flight_arrival_airport') String? flightArrivalAirport,
    @JsonKey(name: 'flight_waypoints') dynamic flightWaypoints, // JSON массив кодов аэропортов
    // Данные пилота (загружаются через JOIN в SQL)
    @JsonKey(name: 'pilot_first_name') String? pilotFirstName,
    @JsonKey(name: 'pilot_last_name') String? pilotLastName,
    @JsonKey(name: 'pilot_phone') String? pilotPhone,
    @JsonKey(name: 'pilot_email') String? pilotEmail,
    @JsonKey(name: 'pilot_telegram') String? pilotTelegram,
    @JsonKey(name: 'pilot_max') String? pilotMax,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);
}

/// Конвертер для int: обрабатывает и строки, и числа
int _intFromJson(dynamic value) {
  print('🔵 [BookingDto] _intFromJson: value=$value, type=${value.runtimeType}');
  if (value is num) {
    final result = value.toInt();
    print('✅ [BookingDto] _intFromJson: converted num to int: $result');
    return result;
  }
  if (value is String) {
    try {
      final result = int.parse(value);
      print('✅ [BookingDto] _intFromJson: converted string to int: $result');
      return result;
    } catch (e) {
      print('❌ [BookingDto] _intFromJson: failed to parse string "$value": $e');
      rethrow;
    }
  }
  print('❌ [BookingDto] _intFromJson: cannot convert $value (${value.runtimeType}) to int');
  throw ArgumentError('Cannot convert $value (${value.runtimeType}) to int');
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

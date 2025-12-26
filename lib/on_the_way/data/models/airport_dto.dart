import 'package:json_annotation/json_annotation.dart';

part 'airport_dto.g.dart';

// Вспомогательные функции для безопасного парсинга
String _stringFromJson(dynamic value, {String defaultValue = ''}) {
  if (value == null) return defaultValue;
  if (value is String) return value;
  return value.toString();
}

int _intFromJson(dynamic value) {
  if (value == null) {
    throw FormatException('Integer cannot be null');
  }
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.parse(value);
  throw FormatException('Invalid integer format: $value (type: ${value.runtimeType})');
}

int? _intFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double _doubleFromJson(dynamic value) {
  if (value == null) {
    throw FormatException('Double cannot be null');
  }
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);
  throw FormatException('Invalid double format: $value (type: ${value.runtimeType})');
}

double? _doubleFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

bool _boolFromJsonWithDefault(dynamic value, {bool defaultValue = false}) {
  if (value == null) return defaultValue;
  if (value is bool) return value;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  if (value is int) return value != 0;
  return defaultValue;
}

DateTime _dateTimeFromJson(dynamic value) {
  if (value == null) {
    throw FormatException('DateTime cannot be null');
  }
  if (value is String) return DateTime.parse(value);
  if (value is DateTime) return value;
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  throw FormatException('Invalid DateTime format: $value (type: ${value.runtimeType})');
}

DateTime? _dateTimeFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is String) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }
  if (value is DateTime) return value;
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  return null;
}

@JsonSerializable()
class AirportDto {
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @JsonKey(fromJson: _stringFromJson)
  final String ident; // ICAO код
  @JsonKey(name: 'ident_ru', fromJson: _stringFromJson)
  final String? identRu; // Русский код
  @JsonKey(fromJson: _stringFromJson)
  final String type; // airport, heliport, etc.
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @JsonKey(name: 'name_eng')
  final String? nameEng; // Английское название
  @JsonKey(name: 'latitude_deg', fromJson: _doubleFromJsonNullable)
  final double? latitudeDeg;
  @JsonKey(name: 'longitude_deg', fromJson: _doubleFromJsonNullable)
  final double? longitudeDeg;
  @JsonKey(name: 'elevation_ft', fromJson: _intFromJsonNullable)
  final int? elevationFt;
  final String? continent;
  @JsonKey(name: 'country_code', fromJson: _stringFromJson)
  final String? countryCode; // Код страны (UU, RU и т.д.)
  final String? country; // Название страны
  @JsonKey(name: 'country_eng')
  final String? countryEng; // Английское название страны
  @JsonKey(name: 'iso_region')
  final String? isoRegion; // Старое поле для совместимости
  final String? region; // Регион
  @JsonKey(name: 'region_eng')
  final String? regionEng; // Английское название региона
  @JsonKey(name: 'coordinates_text')
  final String? coordinatesText; // КТА
  final String? city; // Город (бэкенд возвращает city, а не municipality)
  @JsonKey(name: 'municipality')
  final String? municipality; // Старое поле для совместимости
  final String? ownership; // Принадлежность
  @JsonKey(name: 'scheduled_service')
  final String? scheduledService; // Старое поле
  @JsonKey(name: 'is_international', fromJson: _boolFromJsonWithDefault)
  final bool isInternational; // Международный аэропорт
  final String? email; // Email
  final String? website; // Веб-сайт
  final String? notes; // Заметки
  // Данные о ВПП
  @JsonKey(name: 'runway_name')
  final String? runwayName; // Название ВПП
  @JsonKey(name: 'runway_length', fromJson: _intFromJsonNullable)
  final int? runwayLength; // Длина ВПП
  @JsonKey(name: 'runway_width', fromJson: _intFromJsonNullable)
  final int? runwayWidth; // Ширина ВПП
  @JsonKey(name: 'runway_surface')
  final String? runwaySurface; // Покрытие ВПП
  @JsonKey(name: 'runway_magnetic_course')
  final String? runwayMagneticCourse; // Магнитный курс ВПП
  @JsonKey(name: 'runway_lighting')
  final String? runwayLighting; // Освещение ВПП
  @JsonKey(name: 'gps_code')
  final String? gpsCode;
  @JsonKey(name: 'iata_code')
  final String? iataCode;
  @JsonKey(name: 'local_code')
  final String? localCode;
  final Map<String, dynamic>? services; // Услуги
  @JsonKey(name: 'owner_id', fromJson: _intFromJsonNullable)
  final int? ownerId;
  @JsonKey(name: 'is_verified', fromJson: _boolFromJsonWithDefault)
  final bool isVerified;
  final dynamic photos; // JSONB массив URL официальных фотографий
  @JsonKey(name: 'visitor_photos')
  final dynamic visitorPhotos; // JSONB массив URL фотографий посетителей
  @JsonKey(name: 'is_active', fromJson: _boolFromJsonWithDefault)
  final bool isActive;
  final String? source;
  @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? updatedAt;

  AirportDto({
    required this.id,
    required this.ident,
    this.identRu,
    required this.type,
    required this.name,
    this.nameEng,
    this.latitudeDeg,
    this.longitudeDeg,
    this.elevationFt,
    this.continent,
    this.countryCode,
    this.country,
    this.countryEng,
    this.isoRegion,
    this.region,
    this.regionEng,
    this.coordinatesText,
    this.city,
    this.municipality,
    this.ownership,
    this.scheduledService,
    this.isInternational = false,
    this.email,
    this.website,
    this.notes,
    this.runwayName,
    this.runwayLength,
    this.runwayWidth,
    this.runwaySurface,
    this.runwayMagneticCourse,
    this.runwayLighting,
    this.gpsCode,
    this.iataCode,
    this.localCode,
    this.services,
    this.ownerId,
    this.isVerified = false,
    this.photos,
    this.visitorPhotos,
    this.isActive = true,
    this.source,
    this.createdAt,
    this.updatedAt,
  });

  factory AirportDto.fromJson(Map<String, dynamic> json) {
    try {
      return _$AirportDtoFromJson(json);
    } catch (e, stackTrace) {
      print('❌ [AirportDto] Ошибка парсинга: $e');
      print('❌ [AirportDto] JSON данные: $json');
      print('❌ [AirportDto] Stack trace: $stackTrace');
      rethrow;
    }
  }
  Map<String, dynamic> toJson() => _$AirportDtoToJson(this);
}

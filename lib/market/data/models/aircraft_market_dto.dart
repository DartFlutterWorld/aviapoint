import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'aircraft_market_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class AircraftMarketDto {
  final int id;
  final String title;
  final String? description;
  final int price;
  @JsonKey(defaultValue: 'RUB')
  final String currency;
  @JsonKey(name: 'aircraft_subcategories_id')
  final int? aircraftSubcategoriesId;
  @JsonKey(name: 'seller_id')
  final int sellerId;

  // Изображения
  @JsonKey(name: 'main_image_url', fromJson: _mainImageUrlFromJson)
  final String? mainImageUrl;
  @JsonKey(name: 'additional_image_urls', fromJson: _imageUrlsFromJson)
  final List<String> additionalImageUrls;

  final String? brand;
  final String? location;
  @JsonKey(name: 'is_published')
  final bool? isPublished;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'views_count')
  final int? viewsCount;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  // Характеристики самолёта
  final int? year;
  @JsonKey(name: 'total_flight_hours')
  final int? totalFlightHours;
  @JsonKey(name: 'engine_power')
  final int? enginePower;
  @JsonKey(name: 'engine_volume')
  final int? engineVolume;
  final int? seats;
  final String? condition;

  // Лизинг
  @JsonKey(name: 'is_leasing')
  final bool? isLeasing;
  @JsonKey(name: 'leasing_conditions')
  final String? leasingConditions;

  // Продажа доли
  @JsonKey(name: 'is_share_sale')
  final bool? isShareSale;
  @JsonKey(name: 'share_numerator')
  final int? shareNumerator;
  @JsonKey(name: 'share_denominator')
  final int? shareDenominator;

  // Контактная информация продавца (из JOIN с profiles)
  @JsonKey(name: 'seller_first_name')
  final String? sellerFirstName;
  @JsonKey(name: 'seller_last_name')
  final String? sellerLastName;
  @JsonKey(name: 'seller_phone')
  final String? sellerPhone;
  @JsonKey(name: 'seller_telegram')
  final String? sellerTelegram;
  @JsonKey(name: 'seller_max')
  final String? sellerMax;

  // Метаданные
  @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? updatedAt;
  @JsonKey(name: 'published_until', fromJson: _dateTimeFromJsonNullable)
  final DateTime? publishedUntil;

  AircraftMarketDto({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.currency = 'RUB',
    this.aircraftSubcategoriesId,
    required this.sellerId,
    this.mainImageUrl,
    this.additionalImageUrls = const [],
    this.brand,
    this.location,
    this.isPublished,
    this.isActive,
    this.viewsCount,
    this.isFavorite,
    this.year,
    this.totalFlightHours,
    this.enginePower,
    this.engineVolume,
    this.seats,
    this.condition,
    this.isLeasing,
    this.leasingConditions,
    this.isShareSale,
    this.shareNumerator,
    this.shareDenominator,
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    this.createdAt,
    this.updatedAt,
    this.publishedUntil,
  });

  factory AircraftMarketDto.fromJson(Map<String, dynamic> json) => _$AircraftMarketDtoFromJson(json);
}

String? _mainImageUrlFromJson(dynamic json) {
  if (json == null) return null;
  final url = json.toString();
  return url.isNotEmpty ? url : null;
}

List<String> _imageUrlsFromJson(dynamic json) {
  if (json == null) return [];
  if (json is List) {
    return json.map((e) => e.toString()).where((url) => url.isNotEmpty).toList();
  }
  if (json is String) {
    try {
      final decoded = jsonDecode(json) as List;
      return decoded.map((e) => e.toString()).where((url) => url.isNotEmpty).toList();
    } catch (e) {
      return [];
    }
  }
  return [];
}

DateTime? _dateTimeFromJsonNullable(dynamic json) {
  if (json == null) return null;
  if (json is String) return DateTime.tryParse(json);
  if (json is DateTime) return json;
  return null;
}

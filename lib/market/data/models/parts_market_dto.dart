import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'parts_market_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class PartsMarketDto {
  final int id;
  final String title;
  final String? description;
  final int price;
  @JsonKey(name: 'parts_subcategory_id')
  final int? partsSubcategoryId;
  @JsonKey(name: 'parts_main_category_id')
  final int? partsMainCategoryId;
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @JsonKey(name: 'manufacturer_id')
  final int? manufacturerId;
  @JsonKey(name: 'manufacturer_name')
  final String? manufacturerName;
  final String? location;
  @JsonKey(name: 'address')
  final Map<String, dynamic>? address;
  @JsonKey(name: 'main_image_url', fromJson: _mainImageUrlFromJson)
  final String? mainImageUrl;
  @JsonKey(name: 'additional_image_urls', fromJson: _imageUrlsFromJson)
  final List<String> additionalImageUrls;
  @JsonKey(name: 'part_number')
  final String? partNumber;
  @JsonKey(name: 'oem_number')
  final String? oemNumber;
  final String? condition;
  final int quantity;
  final String currency;
  @JsonKey(name: 'weight_kg')
  final double? weightKg;
  @JsonKey(name: 'dimensions_length_cm')
  final double? dimensionsLengthCm;
  @JsonKey(name: 'dimensions_width_cm')
  final double? dimensionsWidthCm;
  @JsonKey(name: 'dimensions_height_cm')
  final double? dimensionsHeightCm;
  @JsonKey(name: 'compatible_aircraft_models_text')
  final String? compatibleAircraftModelsText;
  @JsonKey(name: 'compatible_aircraft_model_ids', fromJson: _compatibleAircraftModelIdsFromJson)
  final List<int>? compatibleAircraftModelIds;
  @JsonKey(name: 'is_published')
  final bool? isPublished;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'published_until', fromJson: _dateTimeFromJsonNullable)
  final DateTime? publishedUntil;
  @JsonKey(name: 'views_count')
  final int? viewsCount;
  @JsonKey(name: 'favorites_count')
  final int? favoritesCount;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? updatedAt;
  @JsonKey(name: 'sold_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? soldAt;

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

  // Названия категорий (из JOIN)
  @JsonKey(name: 'main_category_name')
  final String? mainCategoryName;
  @JsonKey(name: 'subcategory_name')
  final String? subcategoryName;
  @JsonKey(name: 'manufacturer_name_display')
  final String? manufacturerNameDisplay;

  PartsMarketDto({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.partsSubcategoryId,
    this.partsMainCategoryId,
    required this.sellerId,
    this.manufacturerId,
    this.manufacturerName,
    this.location,
    this.address,
    this.mainImageUrl,
    this.additionalImageUrls = const [],
    this.partNumber,
    this.oemNumber,
    this.condition,
    this.quantity = 1,
    this.currency = 'RUB',
    this.weightKg,
    this.dimensionsLengthCm,
    this.dimensionsWidthCm,
    this.dimensionsHeightCm,
    this.compatibleAircraftModelsText,
    this.compatibleAircraftModelIds,
    this.isPublished,
    this.isActive,
    this.publishedUntil,
    this.viewsCount,
    this.favoritesCount,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
    this.soldAt,
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    this.mainCategoryName,
    this.subcategoryName,
    this.manufacturerNameDisplay,
  });

  factory PartsMarketDto.fromJson(Map<String, dynamic> json) => _$PartsMarketDtoFromJson(json);
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

List<int>? _compatibleAircraftModelIdsFromJson(dynamic json) {
  if (json == null) return null;
  if (json is List) {
    return json.map((e) => e is int ? e : int.tryParse(e.toString())).where((e) => e != null).cast<int>().toList();
  }
  if (json is String) {
    try {
      final decoded = jsonDecode(json) as List;
      return decoded.map((e) => e is int ? e : int.tryParse(e.toString())).where((e) => e != null).cast<int>().toList();
    } catch (e) {
      return null;
    }
  }
  return null;
}

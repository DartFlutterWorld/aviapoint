// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_market_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartsMarketDto _$PartsMarketDtoFromJson(Map<String, dynamic> json) =>
    PartsMarketDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toInt(),
      partsSubcategoryId: (json['parts_subcategory_id'] as num?)?.toInt(),
      partsMainCategoryId: (json['parts_main_category_id'] as num?)?.toInt(),
      sellerId: (json['seller_id'] as num).toInt(),
      manufacturerId: (json['manufacturer_id'] as num?)?.toInt(),
      manufacturerName: json['manufacturer_name'] as String?,
      location: json['location'] as String?,
      mainImageUrl: _mainImageUrlFromJson(json['main_image_url']),
      additionalImageUrls: json['additional_image_urls'] == null
          ? const []
          : _imageUrlsFromJson(json['additional_image_urls']),
      partNumber: json['part_number'] as String?,
      oemNumber: json['oem_number'] as String?,
      condition: json['condition'] as String?,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      currency: json['currency'] as String? ?? 'RUB',
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      dimensionsLengthCm: (json['dimensions_length_cm'] as num?)?.toDouble(),
      dimensionsWidthCm: (json['dimensions_width_cm'] as num?)?.toDouble(),
      dimensionsHeightCm: (json['dimensions_height_cm'] as num?)?.toDouble(),
      compatibleAircraftModelsText:
          json['compatible_aircraft_models_text'] as String?,
      compatibleAircraftModelIds: _compatibleAircraftModelIdsFromJson(
        json['compatible_aircraft_model_ids'],
      ),
      isPublished: json['is_published'] as bool?,
      isActive: json['is_active'] as bool?,
      publishedUntil: _dateTimeFromJsonNullable(json['published_until']),
      viewsCount: (json['views_count'] as num?)?.toInt(),
      favoritesCount: (json['favorites_count'] as num?)?.toInt(),
      isFavorite: json['is_favorite'] as bool?,
      createdAt: _dateTimeFromJsonNullable(json['created_at']),
      updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
      soldAt: _dateTimeFromJsonNullable(json['sold_at']),
      sellerFirstName: json['seller_first_name'] as String?,
      sellerLastName: json['seller_last_name'] as String?,
      sellerPhone: json['seller_phone'] as String?,
      sellerTelegram: json['seller_telegram'] as String?,
      sellerMax: json['seller_max'] as String?,
      mainCategoryName: json['main_category_name'] as String?,
      subcategoryName: json['subcategory_name'] as String?,
      manufacturerNameDisplay: json['manufacturer_name_display'] as String?,
    );

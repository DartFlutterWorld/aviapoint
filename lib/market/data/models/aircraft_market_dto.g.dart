// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_market_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AircraftMarketDto _$AircraftMarketDtoFromJson(Map<String, dynamic> json) =>
    AircraftMarketDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toInt(),
      aircraftSubcategoriesId: (json['aircraft_subcategories_id'] as num?)
          ?.toInt(),
      sellerId: (json['seller_id'] as num).toInt(),
      mainImageUrl: _mainImageUrlFromJson(json['main_image_url']),
      additionalImageUrls: json['additional_image_urls'] == null
          ? const []
          : _imageUrlsFromJson(json['additional_image_urls']),
      brand: json['brand'] as String?,
      location: json['location'] as String?,
      isActive: json['is_active'] as bool?,
      viewsCount: (json['views_count'] as num?)?.toInt(),
      isFavorite: json['is_favorite'] as bool?,
      year: (json['year'] as num?)?.toInt(),
      totalFlightHours: (json['total_flight_hours'] as num?)?.toInt(),
      enginePower: (json['engine_power'] as num?)?.toInt(),
      engineVolume: (json['engine_volume'] as num?)?.toInt(),
      seats: (json['seats'] as num?)?.toInt(),
      condition: json['condition'] as String?,
      isShareSale: json['is_share_sale'] as bool?,
      shareNumerator: (json['share_numerator'] as num?)?.toInt(),
      shareDenominator: (json['share_denominator'] as num?)?.toInt(),
      sellerFirstName: json['seller_first_name'] as String?,
      sellerLastName: json['seller_last_name'] as String?,
      sellerPhone: json['seller_phone'] as String?,
      sellerTelegram: json['seller_telegram'] as String?,
      sellerMax: json['seller_max'] as String?,
      createdAt: _dateTimeFromJsonNullable(json['created_at']),
      updatedAt: _dateTimeFromJsonNullable(json['updated_at']),
      publishedUntil: _dateTimeFromJsonNullable(json['published_until']),
    );

import 'package:aviapoint/market/data/models/aircraft_market_dto.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/market_address_entity.dart';

class AircraftMarketMapper {
  static AircraftMarketEntity toEntity(AircraftMarketDto dto) {
    return AircraftMarketEntity(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      price: dto.price,
      currency: dto.currency,
      aircraftSubcategoriesId: dto.aircraftSubcategoriesId,
      sellerId: dto.sellerId,
      mainImageUrl: dto.mainImageUrl,
      additionalImageUrls: dto.additionalImageUrls,
      brand: dto.brand,
      location: dto.location,
      address: dto.address != null
          ? MarketAddressEntity(
              country: dto.address?['country'] as String?,
              region: (dto.address?['state'] ?? dto.address?['region'] ?? dto.address?['state_district']) as String?,
              city: (dto.address?['city'] ??
                      dto.address?['town'] ??
                      dto.address?['village'] ??
                      dto.address?['municipality'] ??
                      dto.address?['hamlet']) as String?,
              street: (dto.address?['road'] ?? dto.address?['street']) as String?,
              houseNumber: dto.address?['house_number'] as String?,
              postcode: dto.address?['postcode'] as String?,
            )
          : null,
      isPublished: dto.isPublished ?? true,
      isActive: dto.isActive ?? true,
      viewsCount: dto.viewsCount ?? 0,
      isFavorite: dto.isFavorite,
      year: dto.year,
      totalFlightHours: dto.totalFlightHours,
      enginePower: dto.enginePower,
      engineVolume: dto.engineVolume,
      seats: dto.seats,
      condition: dto.condition,
      isLeasing: dto.isLeasing,
      leasingConditions: dto.leasingConditions,
      isShareSale: dto.isShareSale,
      shareNumerator: dto.shareNumerator,
      shareDenominator: dto.shareDenominator,
      sellerFirstName: dto.sellerFirstName,
      sellerLastName: dto.sellerLastName,
      sellerPhone: dto.sellerPhone,
      sellerTelegram: dto.sellerTelegram,
      sellerMax: dto.sellerMax,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      publishedUntil: dto.publishedUntil,
    );
  }

  static List<AircraftMarketEntity> toEntities(List<AircraftMarketDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}

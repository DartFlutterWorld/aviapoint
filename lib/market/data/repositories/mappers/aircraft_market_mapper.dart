import 'package:aviapoint/market/data/models/aircraft_market_dto.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';

class AircraftMarketMapper {
  static AircraftMarketEntity toEntity(AircraftMarketDto dto) {
    return AircraftMarketEntity(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      price: dto.price,
      aircraftSubcategoriesId: dto.aircraftSubcategoriesId,
      sellerId: dto.sellerId,
      mainImageUrl: dto.mainImageUrl,
      additionalImageUrls: dto.additionalImageUrls,
      brand: dto.brand,
      location: dto.location,
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

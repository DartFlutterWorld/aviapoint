import 'package:aviapoint/market/data/models/parts_market_dto.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/entities/market_address_entity.dart';

class PartsMarketMapper {
  static PartsMarketEntity toEntity(PartsMarketDto dto) {
    return PartsMarketEntity(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      price: dto.price,
      partsSubcategoryId: dto.partsSubcategoryId,
      partsMainCategoryId: dto.partsMainCategoryId,
      sellerId: dto.sellerId,
      manufacturerId: dto.manufacturerId,
      manufacturerName: dto.manufacturerName,
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
      mainImageUrl: dto.mainImageUrl,
      additionalImageUrls: dto.additionalImageUrls,
      partNumber: dto.partNumber,
      oemNumber: dto.oemNumber,
      condition: dto.condition,
      quantity: dto.quantity,
      currency: dto.currency,
      weightKg: dto.weightKg,
      dimensionsLengthCm: dto.dimensionsLengthCm,
      dimensionsWidthCm: dto.dimensionsWidthCm,
      dimensionsHeightCm: dto.dimensionsHeightCm,
      compatibleAircraftModelsText: dto.compatibleAircraftModelsText,
      compatibleAircraftModelIds: dto.compatibleAircraftModelIds,
      isPublished: dto.isPublished ?? false,
      isActive: dto.isActive ?? true,
      publishedUntil: dto.publishedUntil,
      viewsCount: dto.viewsCount ?? 0,
      favoritesCount: dto.favoritesCount ?? 0,
      isFavorite: dto.isFavorite,
      sellerFirstName: dto.sellerFirstName,
      sellerLastName: dto.sellerLastName,
      sellerPhone: dto.sellerPhone,
      sellerTelegram: dto.sellerTelegram,
      sellerMax: dto.sellerMax,
      mainCategoryName: dto.mainCategoryName,
      subcategoryName: dto.subcategoryName,
      manufacturerNameDisplay: dto.manufacturerNameDisplay,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      soldAt: dto.soldAt,
    );
  }

  static List<PartsMarketEntity> toEntityList(List<PartsMarketDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}

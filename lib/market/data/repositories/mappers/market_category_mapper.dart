import 'package:aviapoint/market/data/models/market_category_dto.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';

class MarketCategoryMapper {
  static MarketCategoryEntity toEntity(MarketCategoryDto dto) {
    return MarketCategoryEntity(
      id: dto.id,
      name: dto.name,
      nameEn: dto.nameEn,
      iconUrl: dto.iconUrl,
      productType: dto.productType,
      parentId: dto.parentId,
      displayOrder: dto.displayOrder ?? 0,
      isMain: dto.isMain ?? false,
    );
  }

  static List<MarketCategoryEntity> toEntities(List<MarketCategoryDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}

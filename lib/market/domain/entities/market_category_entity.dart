class MarketCategoryEntity {
  final int id;
  final String name;
  final String? nameEn;
  final String? iconUrl;
  final String productType; // 'aircraft' или 'parts'
  final int? parentId;
  final int? partsMainCategoryId; // Для запчастей: ID главной категории
  final int displayOrder;
  final bool isMain;

  MarketCategoryEntity({
    required this.id,
    required this.name,
    this.nameEn,
    this.iconUrl,
    required this.productType,
    this.parentId,
    this.partsMainCategoryId,
    this.displayOrder = 0,
    this.isMain = false,
  });
}

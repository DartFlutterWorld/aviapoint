class MarketCategoryEntity {
  final int id;
  final String name;
  final String? nameEn;
  final String? iconUrl;
  final String productType; // 'aircraft' или 'parts'
  final int? parentId;
  final int displayOrder;
  final bool isMain;

  MarketCategoryEntity({
    required this.id,
    required this.name,
    this.nameEn,
    this.iconUrl,
    required this.productType,
    this.parentId,
    this.displayOrder = 0,
    this.isMain = false,
  });
}

import 'package:json_annotation/json_annotation.dart';

part 'market_category_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class MarketCategoryDto {
  final int id;
  final String name;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'product_type')
  final String productType;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @JsonKey(name: 'parts_main_category_id')
  final int? partsMainCategoryId;
  @JsonKey(name: 'display_order')
  final int? displayOrder;
  @JsonKey(name: 'is_main')
  final bool? isMain;

  MarketCategoryDto({
    required this.id,
    required this.name,
    this.nameEn,
    this.iconUrl,
    required this.productType,
    this.parentId,
    this.partsMainCategoryId,
    this.displayOrder,
    this.isMain,
  });

  factory MarketCategoryDto.fromJson(Map<String, dynamic> json) => _$MarketCategoryDtoFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'parts_manufacturer_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class PartsManufacturerDto {
  final int id;
  final String name;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  final String? country;

  PartsManufacturerDto({required this.id, required this.name, this.nameEn, this.country});

  factory PartsManufacturerDto.fromJson(Map<String, dynamic> json) => _$PartsManufacturerDtoFromJson(json);
}

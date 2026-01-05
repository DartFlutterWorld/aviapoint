import 'package:freezed_annotation/freezed_annotation.dart';
import 'aircraft_manufacturer_dto.dart';

part 'aircraft_model_dto.freezed.dart';
part 'aircraft_model_dto.g.dart';

@freezed
abstract class AircraftModelDto with _$AircraftModelDto {
  const factory AircraftModelDto({
    required int id,
    @JsonKey(name: 'manufacturer_id') required int manufacturerId,
    @JsonKey(name: 'model_code') required String modelCode,
    @JsonKey(name: 'full_name') required String fullName,
    String? category,
    @JsonKey(name: 'engine_type') String? engineType,
    @JsonKey(name: 'engine_count') @Default(1) int engineCount,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    AircraftManufacturerDto? manufacturer,
  }) = _AircraftModelDto;

  factory AircraftModelDto.fromJson(Map<String, dynamic> json) => _$AircraftModelDtoFromJson(json);
}

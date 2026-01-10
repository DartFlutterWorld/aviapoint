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
    AircraftManufacturerDto? manufacturer,
  }) = _AircraftModelDto;

  factory AircraftModelDto.fromJson(Map<String, dynamic> json) => _$AircraftModelDtoFromJson(json);
}

/// Extension для получения полного названия модели
extension AircraftModelDtoExtension on AircraftModelDto {
  /// Получить полное название модели (производитель + код модели)
  String getFullName() {
    final manufacturerName = manufacturer?.name ?? '';
    final name = '$manufacturerName $modelCode'.trim();
    return name.isEmpty ? modelCode : name;
  }
}

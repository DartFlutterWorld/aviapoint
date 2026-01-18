import 'package:freezed_annotation/freezed_annotation.dart';

part 'aircraft_manufacturer_dto.freezed.dart';
part 'aircraft_manufacturer_dto.g.dart';

@freezed
abstract class AircraftManufacturerDto with _$AircraftManufacturerDto {
  const factory AircraftManufacturerDto({required int id, required String name}) = _AircraftManufacturerDto;

  factory AircraftManufacturerDto.fromJson(Map<String, dynamic> json) => _$AircraftManufacturerDtoFromJson(json);
}

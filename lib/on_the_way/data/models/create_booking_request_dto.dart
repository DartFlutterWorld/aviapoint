import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_booking_request_dto.freezed.dart';
part 'create_booking_request_dto.g.dart';

@freezed
abstract class CreateBookingRequestDto with _$CreateBookingRequestDto {
  const factory CreateBookingRequestDto({
    @JsonKey(name: 'flight_id') required int flightId,
    @JsonKey(name: 'seats_count') required int seatsCount,
  }) = _CreateBookingRequestDto;

  factory CreateBookingRequestDto.fromJson(Map<String, dynamic> json) => _$CreateBookingRequestDtoFromJson(json);
}

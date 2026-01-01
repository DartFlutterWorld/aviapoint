import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_airport_review_request_dto.freezed.dart';
part 'create_airport_review_request_dto.g.dart';

@freezed
abstract class CreateAirportReviewRequestDto with _$CreateAirportReviewRequestDto {
  const factory CreateAirportReviewRequestDto({
    @JsonKey(name: 'airport_code') required String airportCode,
    @JsonKey(name: 'reviewer_id') required int reviewerId,
    required int rating,
    String? comment,
    @JsonKey(name: 'reply_to_review_id') int? replyToReviewId,
  }) = _CreateAirportReviewRequestDto;

  factory CreateAirportReviewRequestDto.fromJson(Map<String, dynamic> json) => _$CreateAirportReviewRequestDtoFromJson(json);
}


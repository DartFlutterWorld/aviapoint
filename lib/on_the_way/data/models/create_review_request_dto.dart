import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_request_dto.freezed.dart';
part 'create_review_request_dto.g.dart';

@freezed
abstract class CreateReviewRequestDto with _$CreateReviewRequestDto {
  const factory CreateReviewRequestDto({
    @JsonKey(name: 'booking_id') required int bookingId,
    @JsonKey(name: 'reviewed_id') required int reviewedId,
    int? rating,
    String? comment,
    @JsonKey(name: 'reply_to_review_id') int? replyToReviewId,
  }) = _CreateReviewRequestDto;

  factory CreateReviewRequestDto.fromJson(Map<String, dynamic> json) => _$CreateReviewRequestDtoFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_airport_review_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAirportReviewRequestDto _$CreateAirportReviewRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateAirportReviewRequestDto(
  airportCode: json['airport_code'] as String,
  reviewerId: (json['reviewer_id'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  replyToReviewId: (json['reply_to_review_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateAirportReviewRequestDtoToJson(
  _CreateAirportReviewRequestDto instance,
) => <String, dynamic>{
  'airport_code': instance.airportCode,
  'reviewer_id': instance.reviewerId,
  'rating': instance.rating,
  'comment': instance.comment,
  'reply_to_review_id': instance.replyToReviewId,
};

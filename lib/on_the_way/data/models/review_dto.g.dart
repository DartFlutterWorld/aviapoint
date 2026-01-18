// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => _ReviewDto(
  id: (json['id'] as num).toInt(),
  bookingId: (json['booking_id'] as num).toInt(),
  reviewerId: (json['reviewer_id'] as num).toInt(),
  reviewedId: (json['reviewed_id'] as num).toInt(),
  rating: (json['rating'] as num?)?.toInt(),
  comment: json['comment'] as String?,
  replyToReviewId: (json['reply_to_review_id'] as num?)?.toInt(),
  createdAt: _dateTimeFromJsonNullable(json['created_at']),
  reviewerFirstName: json['reviewer_first_name'] as String?,
  reviewerLastName: json['reviewer_last_name'] as String?,
  reviewerAvatarUrl: json['reviewer_avatar_url'] as String?,
  flightId: _intFromJsonNullable(json['flight_id']),
);

Map<String, dynamic> _$ReviewDtoToJson(_ReviewDto instance) => <String, dynamic>{
  'id': instance.id,
  'booking_id': instance.bookingId,
  'reviewer_id': instance.reviewerId,
  'reviewed_id': instance.reviewedId,
  'rating': instance.rating,
  'comment': instance.comment,
  'reply_to_review_id': instance.replyToReviewId,
  'created_at': instance.createdAt?.toIso8601String(),
  'reviewer_first_name': instance.reviewerFirstName,
  'reviewer_last_name': instance.reviewerLastName,
  'reviewer_avatar_url': instance.reviewerAvatarUrl,
  'flight_id': instance.flightId,
};

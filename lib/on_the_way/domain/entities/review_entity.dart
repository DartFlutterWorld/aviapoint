import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int id;
  final int bookingId;
  final int reviewerId;
  final int reviewedId;
  final int? rating;
  final String? comment;
  final int? replyToReviewId;
  final DateTime? createdAt;
  final String? reviewerFirstName;
  final String? reviewerLastName;
  final String? reviewerAvatarUrl;
  final int? flightId;

  const ReviewEntity({
    required this.id,
    required this.bookingId,
    required this.reviewerId,
    required this.reviewedId,
    required this.rating,
    this.comment,
    this.replyToReviewId,
    this.createdAt,
    this.reviewerFirstName,
    this.reviewerLastName,
    this.reviewerAvatarUrl,
    this.flightId,
  });

  String get reviewerName {
    if (reviewerFirstName != null && reviewerLastName != null) {
      return '${reviewerFirstName!} ${reviewerLastName!}'.trim();
    } else if (reviewerFirstName != null) {
      return reviewerFirstName!;
    } else if (reviewerLastName != null) {
      return reviewerLastName!;
    }
    return 'Пользователь';
  }

  @override
  List<Object?> get props => [
    id,
    bookingId,
    reviewerId,
    reviewedId,
    rating,
    comment,
    replyToReviewId,
    createdAt,
    reviewerFirstName,
    reviewerLastName,
    reviewerAvatarUrl,
    flightId,
  ];
}

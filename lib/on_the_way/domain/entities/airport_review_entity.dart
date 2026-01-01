import 'package:equatable/equatable.dart';

class AirportReviewEntity extends Equatable {
  final int id;
  final String airportCode;
  final int reviewerId;
  final int? rating;
  final String? comment;
  final List<String>? photoUrls;
  final int? replyToReviewId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? reviewerFirstName;
  final String? reviewerLastName;
  final String? reviewerAvatarUrl;

  const AirportReviewEntity({
    required this.id,
    required this.airportCode,
    required this.reviewerId,
    required this.rating,
    this.comment,
    this.photoUrls,
    this.replyToReviewId,
    this.createdAt,
    this.updatedAt,
    this.reviewerFirstName,
    this.reviewerLastName,
    this.reviewerAvatarUrl,
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

  bool get hasPhotos => photoUrls != null && photoUrls!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        airportCode,
        reviewerId,
        rating,
        comment,
        photoUrls,
        replyToReviewId,
        createdAt,
        updatedAt,
        reviewerFirstName,
        reviewerLastName,
        reviewerAvatarUrl,
      ];
}


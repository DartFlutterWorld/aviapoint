import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_comment_dto.freezed.dart';
part 'blog_comment_dto.g.dart';

@freezed
abstract class BlogCommentDto with _$BlogCommentDto {
  const factory BlogCommentDto({
    required int id,
    @JsonKey(name: 'article_id') required int articleId,
    @JsonKey(name: 'author_id') required int authorId,
    @JsonKey(name: 'parent_comment_id') int? parentCommentId,
    required String content,
    @JsonKey(name: 'is_approved') @Default(true) bool isApproved,
    @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable) DateTime? updatedAt,
    @JsonKey(name: 'author_first_name') String? authorFirstName,
    @JsonKey(name: 'author_last_name') String? authorLastName,
    @JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,
    @JsonKey(name: 'author_rating', fromJson: _doubleFromJsonNullable) double? authorRating,
  }) = _BlogCommentDto;

  factory BlogCommentDto.fromJson(Map<String, dynamic> json) => _$BlogCommentDtoFromJson(json);
}

/// Парсит DateTime из строки, объекта DateTime или int (timestamp)
DateTime _dateTimeFromJson(dynamic json) {
  if (json == null) {
    throw FormatException('DateTime cannot be null');
  }
  if (json is String) {
    return DateTime.parse(json);
  } else if (json is DateTime) {
    return json;
  } else if (json is int) {
    return DateTime.fromMillisecondsSinceEpoch(json);
  } else {
    throw FormatException('Invalid DateTime format: $json (type: ${json.runtimeType})');
  }
}

/// Парсит nullable DateTime
DateTime? _dateTimeFromJsonNullable(dynamic json) {
  if (json == null) {
    return null;
  }
  return _dateTimeFromJson(json);
}

/// Парсит nullable double
double? _doubleFromJsonNullable(dynamic json) {
  if (json == null) return null;
  if (json is double) return json;
  if (json is num) return json.toDouble();
  if (json is String) return double.tryParse(json);
  return null;
}

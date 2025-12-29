import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    required int id,
    required String phone,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? telegram,
    String? max,
    @JsonKey(name: 'average_rating', fromJson: _doubleFromJsonNullable) double? averageRating,
    @JsonKey(name: 'reviews_count', fromJson: _intFromJsonNullable) int? reviewsCount,
    @JsonKey(name: 'owned_airports') dynamic ownedAirports, // JSONB массив ID аэропортов
  }) = _ProfileDto;

  // factory ProfileDto.fromEntity(ProfileEntity profile) => ProfileDto(
  //       id: profile.id,
  //       verified: profile.verified,
  //       // edmReleased: profile.edmReleased,
  //       type: profile.type,
  //     );

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);
}

/// Парсит nullable double
double? _doubleFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

/// Парсит nullable int
int? _intFromJsonNullable(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'job_contact_profile_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class JobContactProfileDto {
  final int id;
  @JsonKey(name: 'owner_id')
  final int ownerId;
  @JsonKey(name: 'is_private')
  final bool isPrivate;
  final String? companyName;
  final String? inn;
  final String? address;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'additional_image_urls', fromJson: _imageUrlsFromJson)
  final List<String> additionalImageUrls;
  final String contactName;
  @JsonKey(name: 'contact_position')
  final String contactPosition;
  final String contactPhone;
  final String? contactPhoneAlt;
  final String? contactTelegram;
  final String? contactWhatsapp;
  final String? contactMax;
  final String? contactEmail;
  final String? contactSite;
  final String? createdAt;
  final String? updatedAt;

  JobContactProfileDto({
    required this.id,
    required this.ownerId,
    required this.isPrivate,
    this.companyName,
    this.inn,
    this.address,
    this.logoUrl,
    this.additionalImageUrls = const [],
    required this.contactName,
    required this.contactPosition,
    required this.contactPhone,
    this.contactPhoneAlt,
    this.contactTelegram,
    this.contactWhatsapp,
    this.contactMax,
    this.contactEmail,
    this.contactSite,
    this.createdAt,
    this.updatedAt,
  });

  factory JobContactProfileDto.fromJson(Map<String, dynamic> json) => _$JobContactProfileDtoFromJson(json);

  static List<String> _imageUrlsFromJson(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
    }
    if (value is String && value.isNotEmpty) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is List) {
          return decoded.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
        }
      } catch (_) {}
    }
    return [];
  }
}

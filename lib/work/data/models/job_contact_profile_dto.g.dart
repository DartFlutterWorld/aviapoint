// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_contact_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobContactProfileDto _$JobContactProfileDtoFromJson(
  Map<String, dynamic> json,
) => JobContactProfileDto(
  id: (json['id'] as num).toInt(),
  ownerId: (json['owner_id'] as num).toInt(),
  isPrivate: json['is_private'] as bool,
  companyName: json['company_name'] as String?,
  inn: json['inn'] as String?,
  address: json['address'] as String?,
  logoUrl: json['logo_url'] as String?,
  additionalImageUrls: json['additional_image_urls'] == null
      ? const []
      : JobContactProfileDto._imageUrlsFromJson(json['additional_image_urls']),
  contactName: json['contact_name'] as String,
  contactPosition: json['contact_position'] as String,
  contactPhone: json['contact_phone'] as String,
  contactPhoneAlt: json['contact_phone_alt'] as String?,
  contactTelegram: json['contact_telegram'] as String?,
  contactWhatsapp: json['contact_whatsapp'] as String?,
  contactMax: json['contact_max'] as String?,
  contactEmail: json['contact_email'] as String?,
  contactSite: json['contact_site'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

class JobContactProfileEntity {
  final int id;
  final int ownerId;
  final bool isPrivate;
  final String? companyName;
  final String? inn;
  final String? address;
  final String? logoUrl;
  final List<String> additionalImageUrls;
  final String contactName;
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

  const JobContactProfileEntity({
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
}

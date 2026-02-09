class JobVacancyEntity {
  final int id;
  final int employerId;
  final int? contactProfileId;
  final String title;
  final String? inn;
  final String? companyName;
  final String? description;
  final String? responsibilities;
  final String? requirements;
  final String? conditions;
  final int? salaryFrom;
  final int? salaryTo;
  final String? currency;
  final bool? isGross;
  final String? employmentType; // full_time | part_time | project | internship
  final String? schedule; // office | remote | hybrid | shift | fly_in_fly_out
  final String? experienceLevel; // no_experience | 1_3 | 3_6 | 6_plus
  final String? educationLevel;
  final String? city;
  final String? region;
  final String? airportCode;
  final String? address;
  final String? employmentForm;
  final String? workHours;
  final bool? relocationAllowed;
  final String? businessTrips; // rarely / often / never etc.
  final String? aircraftCategory;
  final String? requiredLicense;
  final int? minFlightHours;
  final String? requiredTypeRating;
  final List<String>? skills;
  final bool isPublished;
  final bool isActive;
  final String? status;
  final String? publishedUntil;
  final int viewsCount;
  final int responsesCount;
  final String? createdAt;
  final String? updatedAt;
  final String? employerFirstName;
  final String? employerLastName;
  final String? employerPhone;
  final String? employerTelegram;
  final String? employerMax;
  final bool? isPrivate;
  final String? contactName;
  final String? contactPosition;
  final String? contactPhone;
  final String? contactPhoneAlt;
  final String? contactTelegram;
  final String? contactWhatsapp;
  final String? contactMax;
  final String? contactEmail;
  final String? contactSite;
  final bool? isFavorite;
  final bool? userHasResponded;
  final String? logoUrl;
  final List<String> additionalImageUrls;

  JobVacancyEntity({
    required this.id,
    required this.employerId,
    this.contactProfileId,
    required this.title,
    this.inn,
    this.companyName,
    this.description,
    this.responsibilities,
    this.requirements,
    this.conditions,
    this.salaryFrom,
    this.salaryTo,
    this.currency,
    this.isGross,
    this.employmentType,
    this.schedule,
    this.experienceLevel,
    this.educationLevel,
    this.city,
    this.region,
    this.airportCode,
    this.address,
    this.employmentForm,
    this.workHours,
    this.relocationAllowed,
    this.businessTrips,
    this.aircraftCategory,
    this.requiredLicense,
    this.minFlightHours,
    this.requiredTypeRating,
    this.skills,
    required this.isPublished,
    required this.isActive,
    this.status,
    this.publishedUntil,
    required this.viewsCount,
    required this.responsesCount,
    this.createdAt,
    this.updatedAt,
    this.employerFirstName,
    this.employerLastName,
    this.employerPhone,
    this.employerTelegram,
    this.employerMax,
    this.isPrivate,
    this.contactName,
    this.contactPosition,
    this.contactPhone,
    this.contactPhoneAlt,
    this.contactTelegram,
    this.contactWhatsapp,
    this.contactMax,
    this.contactEmail,
    this.contactSite,
    this.isFavorite,
    this.userHasResponded,
    this.logoUrl,
    this.additionalImageUrls = const [],
  });

  JobVacancyEntity copyWith({bool? isFavorite, bool? userHasResponded, String? logoUrl, List<String>? additionalImageUrls}) {
    return JobVacancyEntity(
      id: id,
      employerId: employerId,
      contactProfileId: contactProfileId,
      title: title,
      inn: inn,
      companyName: companyName,
      description: description,
      responsibilities: responsibilities,
      requirements: requirements,
      conditions: conditions,
      salaryFrom: salaryFrom,
      salaryTo: salaryTo,
      currency: currency,
      isGross: isGross,
      employmentType: employmentType,
      schedule: schedule,
      experienceLevel: experienceLevel,
      educationLevel: educationLevel,
      city: city,
      region: region,
      airportCode: airportCode,
      address: address,
      employmentForm: employmentForm,
      workHours: workHours,
      relocationAllowed: relocationAllowed,
      businessTrips: businessTrips,
      aircraftCategory: aircraftCategory,
      requiredLicense: requiredLicense,
      minFlightHours: minFlightHours,
      requiredTypeRating: requiredTypeRating,
      skills: skills,
      isPublished: isPublished,
      isActive: isActive,
      status: status,
      publishedUntil: publishedUntil,
      viewsCount: viewsCount,
      responsesCount: responsesCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      employerFirstName: employerFirstName,
      employerLastName: employerLastName,
      employerPhone: employerPhone,
      employerTelegram: employerTelegram,
      employerMax: employerMax,
      isPrivate: isPrivate,
      contactName: contactName,
      contactPosition: contactPosition,
      contactPhone: contactPhone,
      contactPhoneAlt: contactPhoneAlt,
      contactTelegram: contactTelegram,
      contactWhatsapp: contactWhatsapp,
      contactMax: contactMax,
      contactEmail: contactEmail,
      contactSite: contactSite,
      isFavorite: isFavorite ?? this.isFavorite,
      userHasResponded: userHasResponded ?? this.userHasResponded,
      logoUrl: logoUrl ?? this.logoUrl,
      additionalImageUrls: additionalImageUrls ?? this.additionalImageUrls,
    );
  }
}

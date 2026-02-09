class JobResumeEntity {
  final int id;
  final int userId;
  final String title;
  final String? about;
  final String status;
  final bool isVisibleForEmployers;
  final int? desiredSalary;
  final String? currency;
  final String? employmentTypes;
  final String? schedules;
  final bool? readyToRelocate;
  final bool? readyForBusinessTrips;
  final String? address;
  final String? dateOfBirth;
  final List<String>? citizenship;
  final bool? workPermit;
  final String? photoUrl;
  final List<String>? additionalPhotoUrls;
  final int? contactProfileId;
  final String? currentPosition;
  final String? currentCompany;
  final int? totalExperienceMonths;
  final int? flightHoursTotal;
  final int? flightHoursPic;
  final String? licenses;
  final String? typeRatings;
  final String? medicalClass;
  final String? createdAt;
  final String? updatedAt;
  final String? lastActiveAt;
  final String? contactName;
  final String? contactPhone;
  final String? contactTelegram;

  JobResumeEntity({
    required this.id,
    required this.userId,
    required this.title,
    this.about,
    required this.status,
    required this.isVisibleForEmployers,
    this.desiredSalary,
    this.currency,
    this.employmentTypes,
    this.schedules,
    this.readyToRelocate,
    this.readyForBusinessTrips,
    this.address,
    this.dateOfBirth,
    this.citizenship,
    this.workPermit,
    this.photoUrl,
    this.additionalPhotoUrls,
    this.contactProfileId,
    this.currentPosition,
    this.currentCompany,
    this.totalExperienceMonths,
    this.flightHoursTotal,
    this.flightHoursPic,
    this.licenses,
    this.typeRatings,
    this.medicalClass,
    this.createdAt,
    this.updatedAt,
    this.lastActiveAt,
    this.contactName,
    this.contactPhone,
    this.contactTelegram,
  });
}

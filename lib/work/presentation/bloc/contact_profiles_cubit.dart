import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'contact_profiles_cubit.freezed.dart';

@freezed
class ContactProfilesState with _$ContactProfilesState {
  const factory ContactProfilesState.initial() = InitialContactProfilesState;
  const factory ContactProfilesState.loading() = LoadingContactProfilesState;
  const factory ContactProfilesState.success({required List<JobContactProfileEntity> profiles}) =
      SuccessContactProfilesState;
  const factory ContactProfilesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorContactProfilesState;
}

class ContactProfilesCubit extends Cubit<ContactProfilesState> {
  final JobsRepository repository;

  ContactProfilesCubit({required this.repository}) : super(const ContactProfilesState.initial());

  Future<void> fetch() async {
    emit(const ContactProfilesState.loading());
    final result = await repository.getContactProfiles();
    result.fold(
      (failure) => emit(_mapError(failure)),
      (profiles) => emit(ContactProfilesState.success(profiles: profiles)),
    );
  }

  Future<JobContactProfileEntity?> createProfile({
    required bool isPrivate,
    String? companyName,
    String? inn,
    String? address,
    String? logoUrl,
    List<String>? additionalImageUrls,
    required String contactName,
    required String contactPosition,
    required String contactPhone,
    String? contactPhoneAlt,
    String? contactTelegram,
    String? contactWhatsapp,
    String? contactMax,
    String? contactEmail,
    String? contactSite,
  }) async {
    final result = await repository.createContactProfile(
      isPrivate: isPrivate,
      companyName: companyName,
      inn: inn,
      address: address,
      logoUrl: logoUrl,
      additionalImageUrls: additionalImageUrls,
      contactName: contactName,
      contactPosition: contactPosition,
      contactPhone: contactPhone,
      contactPhoneAlt: contactPhoneAlt,
      contactTelegram: contactTelegram,
      contactWhatsapp: contactWhatsapp,
      contactMax: contactMax,
      contactEmail: contactEmail,
      contactSite: contactSite,
    );

    return result.fold(
      (failure) {
        emit(_mapError(failure));
        return null;
      },
      (profile) {
        final current = state;
        if (current is SuccessContactProfilesState) {
          emit(ContactProfilesState.success(profiles: [profile, ...current.profiles]));
        }
        return profile;
      },
    );
  }

  Future<JobContactProfileEntity?> updateProfile({
    required int id,
    bool? isPrivate,
    String? companyName,
    String? inn,
    String? address,
    String? logoUrl,
    List<String>? additionalImageUrls,
    String? contactName,
    String? contactPosition,
    String? contactPhone,
    String? contactPhoneAlt,
    String? contactTelegram,
    String? contactWhatsapp,
    String? contactMax,
    String? contactEmail,
    String? contactSite,
  }) async {
    final result = await repository.updateContactProfile(
      id: id,
      isPrivate: isPrivate,
      companyName: companyName,
      inn: inn,
      address: address,
      logoUrl: logoUrl,
      additionalImageUrls: additionalImageUrls,
      contactName: contactName,
      contactPosition: contactPosition,
      contactPhone: contactPhone,
      contactPhoneAlt: contactPhoneAlt,
      contactTelegram: contactTelegram,
      contactWhatsapp: contactWhatsapp,
      contactMax: contactMax,
      contactEmail: contactEmail,
      contactSite: contactSite,
    );

    return result.fold(
      (failure) {
        emit(_mapError(failure));
        return null;
      },
      (profile) {
        final current = state;
        if (current is SuccessContactProfilesState) {
          final updated = current.profiles
              .map((item) => item.id == profile.id ? profile : item)
              .toList();
          emit(ContactProfilesState.success(profiles: updated));
        }
        return profile;
      },
    );
  }

  Future<void> deleteProfile(int id) async {
    final result = await repository.deleteContactProfile(id);
    result.fold(
      (failure) => emit(_mapError(failure)),
      (_) {
        final current = state;
        if (current is SuccessContactProfilesState) {
          final updated = current.profiles.where((item) => item.id != id).toList();
          emit(ContactProfilesState.success(profiles: updated));
        }
      },
    );
  }

  Future<String?> uploadLogo(int id, XFile imageFile) async {
    final result = await repository.uploadContactProfileLogo(id, imageFile);
    return result.fold(
      (failure) {
        emit(_mapError(failure));
        return null;
      },
      (url) => url,
    );
  }

  Future<List<String>?> uploadAdditionalImages(int id, List<XFile> imageFiles) async {
    final result = await repository.uploadContactProfileAdditionalImages(id, imageFiles);
    return result.fold(
      (failure) {
        emit(_mapError(failure));
        return null;
      },
      (urls) => urls,
    );
  }

  ContactProfilesState _mapError(Failure failure) {
    return ContactProfilesState.error(
      errorFromApi: failure.message,
      errorForUser: 'Что-то пошло не так!\nПопробуйте повторить запрос',
      statusCode: failure.statusCode != null ? 'Код ошибки сервера: ${failure.statusCode}' : null,
      stackTrace: null,
      responseMessage: failure.responseMessage,
    );
  }
}

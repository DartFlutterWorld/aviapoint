import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';

import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';

part 'profile_bloc.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const ProfileEvent._();

  const factory ProfileEvent.get() = GetProfileEvent;
  const factory ProfileEvent.initial() = InitialProfileEvent;
}

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState.loading() = LoadingProfileState;
  const factory ProfileState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorProfileState;
  const factory ProfileState.success({required ProfileEntity profile}) = SuccessProfileState;
  const factory ProfileState.initial() = InitialProfileState;
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({required ProfileRepository profileRepository, required AppState initState})
      : _profileRepository = profileRepository,
        super(const InitialProfileState()) {
    on<ProfileEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        initial: (event) => _initial(event, emitter),
      ),
    );
  }

  Future<void> _initial(_, Emitter<ProfileState> emit) async {
    emit(const InitialProfileState());
  }

  Future<void> _get(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(const LoadingProfileState());

    final response = await _profileRepository.getProfile();
    response.fold(
      (l) {
        emit(
          ErrorProfileState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessProfileState(profile: r),
        );
      },
    );
  }
}

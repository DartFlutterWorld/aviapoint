part of 'job_resume_edit_bloc.dart';

@freezed
class JobResumeEditState with _$JobResumeEditState {
  const factory JobResumeEditState.initial() = _Initial;

  const factory JobResumeEditState.creating() = _Creating;
  const factory JobResumeEditState.updating() = _Updating;
  const factory JobResumeEditState.deleting() = _Deleting;

  const factory JobResumeEditState.created({required JobResumeEntity resume}) = _Created;
  const factory JobResumeEditState.updated({required JobResumeEntity resume}) = _Updated;
  const factory JobResumeEditState.deleted({required int id}) = _Deleted;

  const factory JobResumeEditState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = _Error;
}

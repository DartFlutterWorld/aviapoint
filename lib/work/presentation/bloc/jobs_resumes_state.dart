part of 'jobs_resumes_bloc.dart';

@freezed
class JobsResumesState with _$JobsResumesState {
  const factory JobsResumesState.loading() = LoadingJobsResumesState;

  const factory JobsResumesState.loadingMore({required List<JobResumeEntity> resumes}) = LoadingMoreJobsResumesState;

  const factory JobsResumesState.success({required List<JobResumeEntity> resumes, @Default(true) bool hasMore}) =
      SuccessJobsResumesState;

  const factory JobsResumesState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorJobsResumesState;
}

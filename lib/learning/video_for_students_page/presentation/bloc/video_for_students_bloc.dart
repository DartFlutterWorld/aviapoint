import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/entities/video_for_students_entity.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_for_students_bloc.freezed.dart';

@freezed
abstract class VideoForStudentsEvent with _$VideoForStudentsEvent {
  const VideoForStudentsEvent._();

  const factory VideoForStudentsEvent.get() = GetVideoForStudentsEvent;
  const factory VideoForStudentsEvent.getById(int id) = GetByIdVideoForStudentsEvent;
}

@freezed
abstract class VideoForStudentsState with _$VideoForStudentsState {
  const VideoForStudentsState._();
  const factory VideoForStudentsState.loading() = LoadingVideoForStudentsState;
  const factory VideoForStudentsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorVideoForStudentsState;
  const factory VideoForStudentsState.success({required List<VideoForStudentsEntity> videoForStudents}) = SuccessVideoForStudentsState;
  const factory VideoForStudentsState.successById({required VideoForStudentsEntity videoForStudents}) = SuccessByIdVideoForStudentsState;
  const factory VideoForStudentsState.done() = DoneVideoForStudentsState;
}

class VideoForStudentsBloc extends Bloc<VideoForStudentsEvent, VideoForStudentsState> {
  final VideoForStudentsRepository _videoForStudentsRepository;

  VideoForStudentsBloc({required VideoForStudentsRepository videoForStudentsRepository})
      : _videoForStudentsRepository = videoForStudentsRepository,
        super(const LoadingVideoForStudentsState()) {
    on<VideoForStudentsEvent>(
      (event, emitter) => event.map(
        get: (event) => _get(event, emitter),
        getById: (event) => _getById(event, emitter),
      ),
    );
  }

  Future<void> _get(GetVideoForStudentsEvent event, Emitter<VideoForStudentsState> emit) async {
    emit(const LoadingVideoForStudentsState());

    final response = await _videoForStudentsRepository.fetchVideosForStudents();
    response.fold(
      (l) {
        emit(
          ErrorVideoForStudentsState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessVideoForStudentsState(videoForStudents: r),
        );
      },
    );
  }

  Future<void> _getById(GetByIdVideoForStudentsEvent event, Emitter<VideoForStudentsState> emit) async {
    emit(const LoadingVideoForStudentsState());

    final response = await _videoForStudentsRepository.fetchVideoById(event.id);

    response.fold(
      (l) {
        emit(
          ErrorVideoForStudentsState(
            errorForUser: 'Что-то пошло не так! Попробуйте позже..',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(
          SuccessByIdVideoForStudentsState(videoForStudents: r),
        );
      },
    );
  }
}

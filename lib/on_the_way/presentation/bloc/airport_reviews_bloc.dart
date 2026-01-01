import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'airport_reviews_bloc.freezed.dart';

// События
abstract class AirportReviewsEvent {}

class GetAirportReviewsEvent extends AirportReviewsEvent {
  final String airportCode;

  GetAirportReviewsEvent({required this.airportCode});
}

class CreateAirportReviewEvent extends AirportReviewsEvent {
  final String airportCode;
  final int reviewerId;
  final int rating;
  final String? comment;
  final int? replyToReviewId;
  final List<XFile>? photos;

  CreateAirportReviewEvent({
    required this.airportCode,
    required this.reviewerId,
    required this.rating,
    this.comment,
    this.replyToReviewId,
    this.photos,
  });
}

class UpdateAirportReviewEvent extends AirportReviewsEvent {
  final int reviewId;
  final int rating;
  final String? comment;

  UpdateAirportReviewEvent({required this.reviewId, required this.rating, this.comment});
}

class DeleteAirportReviewEvent extends AirportReviewsEvent {
  final int reviewId;

  DeleteAirportReviewEvent({required this.reviewId});
}

class AddAirportReviewPhotosEvent extends AirportReviewsEvent {
  final int reviewId;
  final List<XFile> photos;

  AddAirportReviewPhotosEvent({required this.reviewId, required this.photos});
}

class DeleteAirportReviewPhotoEvent extends AirportReviewsEvent {
  final int reviewId;
  final String photoUrl;

  DeleteAirportReviewPhotoEvent({required this.reviewId, required this.photoUrl});
}

@freezed
class AirportReviewsState with _$AirportReviewsState {
  const AirportReviewsState._();

  const factory AirportReviewsState.loading() = LoadingAirportReviewsState;
  const factory AirportReviewsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorAirportReviewsState;
  const factory AirportReviewsState.success({
    required List<AirportReviewEntity> reviews,
  }) = SuccessAirportReviewsState;
  const factory AirportReviewsState.reviewCreated({required AirportReviewEntity review}) = AirportReviewCreatedState;
  const factory AirportReviewsState.reviewUpdated({required AirportReviewEntity review}) = AirportReviewUpdatedState;
  const factory AirportReviewsState.reviewDeleted() = AirportReviewDeletedState;
}

class AirportReviewsBloc extends Bloc<AirportReviewsEvent, AirportReviewsState> {
  final OnTheWayRepository _onTheWayRepository;

  AirportReviewsBloc({required OnTheWayRepository onTheWayRepository})
      : _onTheWayRepository = onTheWayRepository,
        super(const LoadingAirportReviewsState()) {
    on<GetAirportReviewsEvent>(_handleGetAirportReviews);
    on<CreateAirportReviewEvent>(_handleCreateAirportReview);
    on<UpdateAirportReviewEvent>(_handleUpdateAirportReview);
    on<DeleteAirportReviewEvent>(_handleDeleteAirportReview);
    on<AddAirportReviewPhotosEvent>(_handleAddAirportReviewPhotos);
    on<DeleteAirportReviewPhotoEvent>(_handleDeleteAirportReviewPhoto);
  }

  Future<void> _handleGetAirportReviews(GetAirportReviewsEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.getAirportReviews(event.airportCode);

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось загрузить отзывы',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessAirportReviewsState(reviews: r));
      },
    );
  }

  Future<void> _handleCreateAirportReview(CreateAirportReviewEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.createAirportReview(
      airportCode: event.airportCode,
      reviewerId: event.reviewerId,
      rating: event.rating,
      comment: event.comment,
      replyToReviewId: event.replyToReviewId,
      photos: event.photos,
    );

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось создать отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(AirportReviewCreatedState(review: r));
        // После создания отзыва перезагружаем список
        add(GetAirportReviewsEvent(airportCode: event.airportCode));
      },
    );
  }

  Future<void> _handleUpdateAirportReview(UpdateAirportReviewEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.updateAirportReview(
      reviewId: event.reviewId,
      rating: event.rating,
      comment: event.comment,
    );

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось обновить отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(AirportReviewUpdatedState(review: r));
      },
    );
  }

  Future<void> _handleDeleteAirportReview(DeleteAirportReviewEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.deleteAirportReview(event.reviewId);

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось удалить отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(const AirportReviewDeletedState());
      },
    );
  }

  Future<void> _handleAddAirportReviewPhotos(AddAirportReviewPhotosEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.addAirportReviewPhotos(
      reviewId: event.reviewId,
      photos: event.photos,
    );

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось добавить фотографии',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(AirportReviewUpdatedState(review: r));
      },
    );
  }

  Future<void> _handleDeleteAirportReviewPhoto(DeleteAirportReviewPhotoEvent event, Emitter<AirportReviewsState> emit) async {
    emit(const LoadingAirportReviewsState());

    final response = await _onTheWayRepository.deleteAirportReviewPhoto(
      reviewId: event.reviewId,
      photoUrl: event.photoUrl,
    );

    response.fold(
      (l) {
        emit(
          ErrorAirportReviewsState(
            errorForUser: 'Не удалось удалить фотографию',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(AirportReviewUpdatedState(review: r));
      },
    );
  }
}


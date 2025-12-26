import 'package:aviapoint/on_the_way/domain/entities/review_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_bloc.freezed.dart';

// События
abstract class ReviewsEvent {}

class GetReviewsEvent extends ReviewsEvent {
  final int userId;

  GetReviewsEvent({required this.userId});
}

class GetReviewsByFlightIdEvent extends ReviewsEvent {
  final int flightId;

  GetReviewsByFlightIdEvent({required this.flightId});
}

class CreateReviewEvent extends ReviewsEvent {
  final int bookingId;
  final int reviewedId;
  final int? rating;
  final String? comment;
  final int? replyToReviewId;

  CreateReviewEvent({
    required this.bookingId,
    required this.reviewedId,
    this.rating,
    this.comment,
    this.replyToReviewId,
  });
}

class UpdateReviewEvent extends ReviewsEvent {
  final int reviewId;
  final int rating;
  final String? comment;

  UpdateReviewEvent({required this.reviewId, required this.rating, this.comment});
}

class DeleteReviewEvent extends ReviewsEvent {
  final int reviewId;

  DeleteReviewEvent({required this.reviewId});
}

@freezed
class ReviewsState with _$ReviewsState {
  const ReviewsState._();

  const factory ReviewsState.loading() = LoadingReviewsState;
  const factory ReviewsState.error({
    String? errorFromApi,
    required String errorForUser,
    String? statusCode,
    StackTrace? stackTrace,
    String? responseMessage,
  }) = ErrorReviewsState;
  const factory ReviewsState.success({required List<ReviewEntity> reviews}) = SuccessReviewsState;
  const factory ReviewsState.reviewCreated({required ReviewEntity review}) = ReviewCreatedState;
  const factory ReviewsState.reviewUpdated({required ReviewEntity review}) = ReviewUpdatedState;
  const factory ReviewsState.reviewDeleted() = ReviewDeletedState;
}

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final OnTheWayRepository _onTheWayRepository;

  ReviewsBloc({required OnTheWayRepository onTheWayRepository})
    : _onTheWayRepository = onTheWayRepository,
      super(const LoadingReviewsState()) {
    on<GetReviewsEvent>(_handleGetReviews);
    on<GetReviewsByFlightIdEvent>(_handleGetReviewsByFlightId);
    on<CreateReviewEvent>(_handleCreateReview);
    on<UpdateReviewEvent>(_handleUpdateReview);
    on<DeleteReviewEvent>(_handleDeleteReview);
  }

  Future<void> _handleGetReviews(GetReviewsEvent event, Emitter<ReviewsState> emit) async {
    emit(const LoadingReviewsState());

    final response = await _onTheWayRepository.getReviews(event.userId);

    response.fold(
      (l) {
        emit(
          ErrorReviewsState(
            errorForUser: 'Не удалось загрузить отзывы',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessReviewsState(reviews: r));
      },
    );
  }

  Future<void> _handleGetReviewsByFlightId(GetReviewsByFlightIdEvent event, Emitter<ReviewsState> emit) async {
    emit(const LoadingReviewsState());

    final response = await _onTheWayRepository.getReviewsByFlightId(event.flightId);

    response.fold(
      (l) {
        emit(
          ErrorReviewsState(
            errorForUser: 'Не удалось загрузить отзывы',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(SuccessReviewsState(reviews: r));
      },
    );
  }

  Future<void> _handleCreateReview(CreateReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const LoadingReviewsState());

    final response = await _onTheWayRepository.createReview(
      bookingId: event.bookingId,
      reviewedId: event.reviewedId,
      rating: event.rating,
      comment: event.comment,
      replyToReviewId: event.replyToReviewId,
    );

    response.fold(
      (l) {
        emit(
          ErrorReviewsState(
            errorForUser: 'Не удалось создать отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(ReviewCreatedState(review: r));
        // После создания отзыва перезагружаем список
        add(GetReviewsByFlightIdEvent(flightId: 0)); // TODO: получить flightId из booking
      },
    );
  }

  Future<void> _handleUpdateReview(UpdateReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const LoadingReviewsState());

    final response = await _onTheWayRepository.updateReview(
      reviewId: event.reviewId,
      rating: event.rating,
      comment: event.comment,
    );

    response.fold(
      (l) {
        emit(
          ErrorReviewsState(
            errorForUser: 'Не удалось обновить отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(ReviewUpdatedState(review: r));
      },
    );
  }

  Future<void> _handleDeleteReview(DeleteReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const LoadingReviewsState());

    final response = await _onTheWayRepository.deleteReview(event.reviewId);

    response.fold(
      (l) {
        emit(
          ErrorReviewsState(
            errorForUser: 'Не удалось удалить отзыв',
            errorFromApi: l.message,
            statusCode: 'Код ошибки сервера: ${l.statusCode}',
            responseMessage: l.responseMessage,
          ),
        );
      },
      (r) {
        emit(const ReviewDeletedState());
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReviewsBottomSheet extends StatefulWidget {
  final int userId;
  final String title;

  const UserReviewsBottomSheet({super.key, required this.userId, this.title = 'Отзывы'});

  @override
  State<UserReviewsBottomSheet> createState() => _UserReviewsBottomSheetState();
}

class _UserReviewsBottomSheetState extends State<UserReviewsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // UniversalBottomSheet уже предоставляет SingleChildScrollView и padding
    // Не нужно использовать SafeArea, Expanded или дублировать заголовок
    return BlocProvider(
      create: (context) {
        final bloc = ReviewsBloc(onTheWayRepository: getIt<OnTheWayRepository>());
        bloc.add(GetReviewsEvent(userId: widget.userId));
        return bloc;
      },
      child: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, reviewsState) {
          return reviewsState.when(
            loading: () => Center(
              child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
            ),
            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
              ),
            ),
            success: (reviews, flights) {
              if (reviews.isEmpty) {
                return Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE5E7EB)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.reviews_outlined, size: 48, color: Color(0xFF9CA5AF)),
                        SizedBox(height: 12),
                        Text('Пока нет отзывов', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                    ),
                  ),
                );
              }

              // Группируем отзывы: основные и ответы
              final mainReviews = reviews.where((r) => r.replyToReviewId == null).toList();
              final replies = reviews.where((r) => r.replyToReviewId != null).toList();

              // Используем Column вместо ListView, так как UniversalBottomSheet уже предоставляет SingleChildScrollView
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: mainReviews.map((review) {
                  final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                  final flight = review.flightId != null ? flights[review.flightId] : null;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ReviewCard(
                        review: review,
                        canDelete: false,
                        onTap: () {
                          if (review.flightId != null) {
                            Navigator.of(context).pop();
                            if (context.mounted) {
                              context.router.push(
                                BaseRoute(
                                  children: [
                                    OnTheWayNavigationRoute(children: [FlightDetailRoute(flightId: review.flightId!)]),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        // Передаем рейтинг конкретно за этот полёт
                        reviewedRating: review.rating != null ? review.rating!.toDouble() : null,
                        // Передаем информацию о полёте
                        departureAirport: flight?.departureAirport,
                        arrivalAirport: flight?.arrivalAirport,
                        departureDate: flight?.departureDate,
                        waypoints: flight?.waypoints,
                      ),
                      SizedBox(height: 16),
                      // Ответы на отзыв
                      if (reviewReplies.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: reviewReplies.map((reply) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ReviewCard(
                                    review: reply,
                                    isReply: true,
                                    canDelete: false,
                                    onTap: () {}, // Ответы не требуют навигации
                                  ),
                                  SizedBox(height: 16),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              );
            },
            reviewCreated: (review) => SizedBox.shrink(),
            reviewUpdated: (review) => SizedBox.shrink(),
            reviewDeleted: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

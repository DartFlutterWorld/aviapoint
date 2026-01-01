import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с кнопкой закрытия
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                IconButton(
                  icon: Icon(Icons.close, color: Color(0xFF374151)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocProvider(
                create: (context) {
                  final bloc = ReviewsBloc(onTheWayRepository: getIt<OnTheWayRepository>());
                  bloc.add(GetReviewsEvent(userId: widget.userId));
                  return bloc;
                },
                child: BlocBuilder<ReviewsBloc, ReviewsState>(
                  builder: (context, reviewsState) {
                    return reviewsState.when(
                      loading: () => Center(
                        child: Padding(padding: EdgeInsets.all(20.w), child: CircularProgressIndicator()),
                      ),
                      error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                        ),
                      ),
                      success: (reviews, flights) {
                        if (reviews.isEmpty) {
                          return Container(
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Color(0xFFE5E7EB)),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.reviews_outlined, size: 48, color: Color(0xFF9CA5AF)),
                                  SizedBox(height: 12.h),
                                  Text('Пока нет отзывов', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                                ],
                              ),
                            ),
                          );
                        }

                        // Группируем отзывы: основные и ответы
                        final mainReviews = reviews.where((r) => r.replyToReviewId == null).toList();
                        final replies = reviews.where((r) => r.replyToReviewId != null).toList();

                        return ListView(
                          children: mainReviews.map((review) {
                            final reviewReplies = replies.where((r) => r.replyToReviewId == review.id).toList();
                            final flight = review.flightId != null ? flights[review.flightId] : null;

                            return Column(
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
                                SizedBox(height: 16.h),
                                // Ответы на отзыв
                                if (reviewReplies.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(left: 40.w),
                                    child: Column(
                                      children: reviewReplies.map((reply) {
                                        return Column(
                                          children: [
                                            ReviewCard(
                                              review: reply,
                                              isReply: true,
                                              canDelete: false,
                                              onTap: () {}, // Ответы не требуют навигации
                                            ),
                                            SizedBox(height: 16.h),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

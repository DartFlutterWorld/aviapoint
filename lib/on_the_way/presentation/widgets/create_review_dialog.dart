import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Диалог для создания отзыва
class CreateReviewDialog extends StatefulWidget {
  final BookingEntity booking;
  final int reviewedId;
  final int? replyToReviewId;
  final String? reviewedName;

  const CreateReviewDialog({
    super.key,
    required this.booking,
    required this.reviewedId,
    this.replyToReviewId,
    this.reviewedName,
  });

  @override
  State<CreateReviewDialog> createState() => _CreateReviewDialogState();
}

class _CreateReviewDialogState extends State<CreateReviewDialog> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitReview() {
    // Для ответов рейтинг не требуется, для основных отзывов - обязателен
    if (widget.replyToReviewId == null && _rating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Пожалуйста, выберите рейтинг'), backgroundColor: Colors.red));
      return;
    }

    context.read<ReviewsBloc>().add(
      CreateReviewEvent(
        bookingId: widget.booking.id,
        reviewedId: widget.reviewedId,
        rating: widget.replyToReviewId == null ? _rating : null, // Для ответов рейтинг = null
        comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
        replyToReviewId: widget.replyToReviewId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewsBloc, ReviewsState>(
      listener: (context, state) {
        state.when(
          loading: () {},
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(responseMessage ?? errorForUser),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 4),
              ),
            );
          },
          success: (reviews, flights) {},
          reviewCreated: (review) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Отзыв успешно создан'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          },
          reviewUpdated: (review) {},
          reviewDeleted: () {},
        );
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: BlocBuilder<ReviewsBloc, ReviewsState>(
          builder: (context, state) {
            final isLoading = state is LoadingReviewsState;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.w),
                constraints: BoxConstraints(maxWidth: 400.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Заголовок
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.replyToReviewId != null ? 'Ответить на отзыв' : 'Оставить отзыв',
                          style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    // Информация о том, кому оставляем отзыв
                    if (widget.reviewedName != null)
                      Text(
                        'Отзыв для: ${widget.reviewedName}',
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                    SizedBox(height: 20.h),
                    // Рейтинг (только для основных отзывов, не для ответов)
                    if (widget.replyToReviewId == null) ...[
                      Text('Оценка', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                      SizedBox(height: 12.h),
                      RatingWidget(
                        rating: _rating,
                        readOnly: false,
                        onRatingChanged: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                        size: 32,
                      ),
                      SizedBox(height: 20.h),
                    ],
                    // Комментарий
                    Text('Комментарий (необязательно)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: _commentController,
                      maxLines: 5,
                      enabled: !isLoading,
                      decoration: InputDecoration(
                        hintText: 'Напишите ваш отзыв...',
                        hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                        contentPadding: EdgeInsets.all(12.w),
                      ),
                      style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    ),
                    SizedBox(height: 20.h),
                    // Кнопки
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              side: BorderSide(color: Color(0xFFD1D5DB)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                            ),
                            child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _submitReview,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0A6EFA),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                            ),
                            child: isLoading
                                ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Text('Отправить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

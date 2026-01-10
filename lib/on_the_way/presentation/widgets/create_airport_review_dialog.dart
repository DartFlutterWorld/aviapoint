import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/airport_reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';

/// Диалог для создания отзыва об аэропорте
class CreateAirportReviewDialog extends StatefulWidget {
  final String airportCode;
  final int reviewerId;
  final int? replyToReviewId;

  const CreateAirportReviewDialog({
    super.key,
    required this.airportCode,
    required this.reviewerId,
    this.replyToReviewId,
  });

  @override
  State<CreateAirportReviewDialog> createState() => _CreateAirportReviewDialogState();
}

class _CreateAirportReviewDialogState extends State<CreateAirportReviewDialog> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  List<XFile> _photos = [];

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

    // Для ответов передаем rating = 5 по умолчанию (так как в БД rating NOT NULL)
    // На бэкенде это значение будет игнорироваться для ответов
    final ratingValue = widget.replyToReviewId == null ? _rating : 5;

    context.read<AirportReviewsBloc>().add(
      CreateAirportReviewEvent(
        airportCode: widget.airportCode,
        reviewerId: widget.reviewerId,
        rating: ratingValue,
        comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
        replyToReviewId: widget.replyToReviewId,
        photos: _photos.isNotEmpty ? _photos : null,
      ),
    );
  }

  Future<void> _pickPhotos() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (images == null || images.isEmpty) return;

      setState(() {
        _photos.addAll(images);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось выбрать фотографии: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _deletePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AirportReviewsBloc, AirportReviewsState>(
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
          success: (reviews) {},
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
        child: BlocBuilder<AirportReviewsBloc, AirportReviewsState>(
          builder: (context, state) {
            final isLoading = state is LoadingAirportReviewsState;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.w),
                constraints: BoxConstraints(maxWidth: 500.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Заголовок
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 40.w),
                          child: Text(
                            widget.replyToReviewId != null ? 'Ответить на отзыв' : 'Оставить отзыв об аэропорте',
                            style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                            onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ],
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
                    // Фотографии
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.w,
                      children: [
                        Text('Фотографии (необязательно)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                        TextButton.icon(
                          onPressed: isLoading ? null : _pickPhotos,
                          icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
                          label: Text('Добавить', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    if (_photos.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: _photos.length,
                        itemBuilder: (context, index) {
                          final photo = _photos[index];
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: kIsWeb
                                    ? FutureBuilder<Uint8List>(
                                        future: photo.readAsBytes(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Image.memory(snapshot.data!, fit: BoxFit.cover);
                                          }
                                          return Container(
                                            color: Color(0xFFF3F4F6),
                                            child: Center(child: CircularProgressIndicator()),
                                          );
                                        },
                                      )
                                    : Image.file(File(photo.path), fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 4.h,
                                right: 4.w,
                                child: GestureDetector(
                                  onTap: () => _deletePhoto(index),
                                  child: Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                    child: Icon(Icons.close, size: 16.r, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    else
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.photo_library_outlined, size: 24, color: Color(0xFF9CA5AF)),
                            SizedBox(width: 12.w),
                            Text(
                              'Фотографии не добавлены',
                              style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                            ),
                          ],
                        ),
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

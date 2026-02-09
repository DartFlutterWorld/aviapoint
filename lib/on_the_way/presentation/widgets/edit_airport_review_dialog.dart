import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/on_the_way/domain/entities/airport_review_entity.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/airport_reviews_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';

/// Диалог для редактирования отзыва об аэропорте
class EditAirportReviewDialog extends StatefulWidget {
  final AirportReviewEntity review;

  const EditAirportReviewDialog({super.key, required this.review});

  @override
  State<EditAirportReviewDialog> createState() => _EditAirportReviewDialogState();
}

class _EditAirportReviewDialogState extends State<EditAirportReviewDialog> {
  late int _rating;
  late TextEditingController _commentController;
  List<XFile> _photosToAdd = [];
  List<String> _photosToDelete = [];
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    // Для replies рейтинг может быть null, но для UpdateAirportReviewEvent требуется int
    // Используем текущий рейтинг или 0 если null (для replies это значение не используется на бэкенде)
    _rating = widget.review.rating ?? 0;
    _commentController = TextEditingController(text: widget.review.comment ?? '');
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickPhotos() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (images == null || images.isEmpty) return;

      setState(() {
        _photosToAdd.addAll(images);
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

  void _deleteNewPhoto(int index) {
    setState(() {
      _photosToAdd.removeAt(index);
    });
  }

  void _deleteExistingPhoto(String photoUrl) {
    setState(() {
      if (!_photosToDelete.contains(photoUrl)) {
        _photosToDelete.add(photoUrl);
      }
    });
  }

  void _submitReview() {
    // Для основных отзывов (не replies) рейтинг обязателен
    if (widget.review.replyToReviewId == null && _rating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Пожалуйста, выберите рейтинг'), backgroundColor: Colors.red));
      return;
    }

    // Для replies передаем текущий рейтинг или 0 (на бэкенде для replies рейтинг не используется)
    final ratingValue = widget.review.replyToReviewId == null ? _rating : (widget.review.rating ?? 0);

    // Сначала обновляем отзыв (рейтинг и комментарий)
    context.read<AirportReviewsBloc>().add(
      UpdateAirportReviewEvent(
        reviewId: widget.review.id,
        rating: ratingValue,
        comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
      ),
    );

    // Удаляем и добавляем фотографии будут обработаны после закрытия диалога
    // через callback в _showEditReviewDialog, чтобы избежать конфликтов состояний
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
          reviewCreated: (review) {},
          reviewUpdated: (review) {
            // Закрываем диалог после обновления отзыва
            // Передаем информацию о фотографиях для последующей обработки
            if (!mounted || _isClosing) return;

            _isClosing = true;

            // Закрываем диалог с информацией о фотографиях
            if (Navigator.of(context).canPop()) {
              Navigator.of(
                context,
              ).pop({'updated': true, 'photosToDelete': _photosToDelete, 'photosToAdd': _photosToAdd});
            }

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Отзыв успешно обновлён'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          reviewDeleted: () {},
        );
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: BlocBuilder<AirportReviewsBloc, AirportReviewsState>(
          builder: (context, state) {
            final isLoading = state is LoadingAirportReviewsState;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Заголовок
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Редактировать отзыв',
                              style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                              textAlign: TextAlign.center,
                            ),
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
                    SizedBox(height: 20),
                    // Рейтинг (только для основных отзывов, не для replies)
                    if (widget.review.replyToReviewId == null) ...[
                      Text('Оценка', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                      SizedBox(height: 12),
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
                      SizedBox(height: 20),
                    ],
                    // Комментарий
                    Text('Комментарий (необязательно)', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8),
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
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                      style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    ),
                    SizedBox(height: 20),
                    // Фотографии для добавления
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          'Добавить фотографии (необязательно)',
                          style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                        ),
                        TextButton.icon(
                          onPressed: isLoading ? null : _pickPhotos,
                          icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
                          label: Text('Добавить', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // Отображаем существующие фотографии (кроме удаленных) и новые
                    Builder(
                      builder: (context) {
                        // Фильтруем существующие фотографии (исключая помеченные для удаления)
                        final existingPhotos = (widget.review.photoUrls ?? [])
                            .where((url) => !_photosToDelete.contains(url))
                            .toList();
                        final totalPhotosCount = existingPhotos.length + _photosToAdd.length;

                        if (totalPhotosCount == 0) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFE5E7EB)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.photo_library_outlined, size: 24, color: Color(0xFF9CA5AF)),
                                SizedBox(width: 12),
                                Text(
                                  'Фотографии не добавлены',
                                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                                ),
                              ],
                            ),
                          );
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: totalPhotosCount,
                          itemBuilder: (context, index) {
                            // Существующие фотографии
                            if (index < existingPhotos.length) {
                              final photoUrl = existingPhotos[index];
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: NetworkImageWidget(
                                      imageUrl: _getImageUrl(photoUrl),
                                      fit: BoxFit.cover,
                                      placeholder: Container(
                                        color: Color(0xFFF3F4F6),
                                        child: Center(child: CircularProgressIndicator()),
                                      ),
                                      errorWidget: Container(
                                        color: Color(0xFFF3F4F6),
                                        child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: GestureDetector(
                                      onTap: () => _deleteExistingPhoto(photoUrl),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                        child: Icon(Icons.close, size: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            // Новые фотографии
                            final newPhotoIndex = index - existingPhotos.length;
                            final photo = _photosToAdd[newPhotoIndex];
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
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
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () => _deleteNewPhoto(newPhotoIndex),
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                      child: Icon(Icons.close, size: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    // Кнопка сохранения
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _submitReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A6EFA),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text('Сохранить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                      ),
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

  String _getImageUrl(String photoUrl) {
    if (photoUrl.startsWith('http://') || photoUrl.startsWith('https://')) {
      return photoUrl;
    }
    return '${getBackUrl(useLocal: true)}/$photoUrl';
  }
}

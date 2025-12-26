import 'package:flutter/material.dart';

/// Виджет для отображения и выбора рейтинга (1-5 звезд)
class RatingWidget extends StatelessWidget {
  final int? rating;
  final bool readOnly;
  final ValueChanged<int>? onRatingChanged;
  final double size;

  const RatingWidget({super.key, this.rating, this.readOnly = true, this.onRatingChanged, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    final ratingValue = rating ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isFilled = starIndex <= ratingValue;

        if (readOnly) {
          return Icon(
            isFilled ? Icons.star : Icons.star_border,
            color: isFilled ? Color(0xFFFFA726) : Color(0xFFD1D5DB),
            size: size,
          );
        } else {
          return GestureDetector(
            onTap: () => onRatingChanged?.call(starIndex),
            child: Icon(
              isFilled ? Icons.star : Icons.star_border,
              color: isFilled ? Color(0xFFFFA726) : Color(0xFFD1D5DB),
              size: size,
            ),
          );
        }
      }),
    );
  }
}

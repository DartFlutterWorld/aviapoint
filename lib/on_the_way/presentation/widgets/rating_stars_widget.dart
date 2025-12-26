import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

class RatingStarsWidget extends StatelessWidget {
  final double rating;
  final double? fontSize;
  final Color? starColor;

  const RatingStarsWidget({super.key, required this.rating, this.fontSize, this.starColor});

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Звезды
        ...List.generate(fullStars, (index) => _buildStar(Icons.star, true)),
        if (hasHalfStar) _buildStar(Icons.star_half, true),
        ...List.generate(emptyStars, (index) => _buildStar(Icons.star, false)),
        SizedBox(width: 4.w),
        // Число
        Text(
          rating.toStringAsFixed(1),
          style: AppStyles.bold14s.copyWith(fontSize: fontSize ?? 14.sp, color: Color(0xFF374151)),
        ),
      ],
    );
  }

  Widget _buildStar(IconData icon, bool filled) {
    return Icon(
      icon,
      size: (fontSize ?? 14.sp) + 2,
      color: filled ? (starColor ?? Color(0xFFFFB800)) : Color(0xFFD1D5DB),
    );
  }
}

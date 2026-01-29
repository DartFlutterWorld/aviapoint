import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class BlogCategoryChip extends StatelessWidget {
  final BlogCategoryEntity category;
  final bool isSelected;
  final VoidCallback? onTap;

  const BlogCategoryChip({super.key, required this.category, this.isSelected = false, this.onTap});

  Color _getColor() {
    if (category.color != null && category.color!.isNotEmpty) {
      try {
        return Color(int.parse(category.color!.replaceFirst('#', '0xFF')));
      } catch (e) {
        return AppColors.primary100p;
      }
    }
    return AppColors.primary100p;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? color : const Color(0xFFD9E6F8), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // if (category.iconUrl != null && category.iconUrl!.isNotEmpty)
            //   Padding(
            //     padding: EdgeInsets.only(right: 4),
            //     child: Image.network(category.iconUrl!, width: 14, height: 14, errorBuilder: (context, error, stackTrace) => const SizedBox()),
            //   ),
            Text(category.name, style: AppStyles.regular12s.copyWith(color: isSelected ? Colors.white : AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}

import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String? picture;
  final Widget? child;
  final String icon;
  final VoidCallback? clearCategory;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
    this.picture,
    this.child,
    this.icon = Pictures.strelka,
    this.clearCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: AppColors.netural5p,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .1),
              blurRadius: 15.0,
              offset: const Offset(
                0.0,
                7.0,
              ),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffF3EBFF),
              Color(0xFFFFFAF1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppStyles.titleMidle.copyWith(color: AppColors.textPrimary),
            ),
            // SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    subTitle,
                    style: AppStyles.subTextReg.copyWith(color: AppColors.netural70p),
                  ),
                ),
                Row(
                  children: [
                    if (picture != null && picture!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Image.asset(
                          picture!,
                          height: 60,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: clearCategory,
                        child: Image.asset(
                          icon,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}

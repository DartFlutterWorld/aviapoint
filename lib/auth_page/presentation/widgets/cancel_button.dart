import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap:
          onTap ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        height: 25.w,
        alignment: Alignment.bottomRight,
        child: Text(
          'Отмена',
          style: AppStyles.bold12s.copyWith(
            fontWeight: FontWeight.w600,
            height: 13.92 / 12,
            color: AppColors.textSeconds,
          ),
        ),
      ),
    );
  }
}

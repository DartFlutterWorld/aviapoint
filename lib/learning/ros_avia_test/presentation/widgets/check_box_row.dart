import 'dart:ui';

import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckBoxRow extends StatelessWidget {
  final String title;
  final String questionCount;
  final bool active;
  final VoidCallback onTap;

  const CheckBoxRow({required this.title, required this.questionCount, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 0.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: SvgPicture.asset(active ? Pictures.checkBoxActive : Pictures.checkBox, fit: BoxFit.cover),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(title, style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767))),
            ),
            SizedBox(width: 8),
            Text('($questionCount)', style: AppStyles.medium10s.copyWith(color: const Color(0xFF9CA5AF))),
          ],
        ),
      ),
    );
  }
}

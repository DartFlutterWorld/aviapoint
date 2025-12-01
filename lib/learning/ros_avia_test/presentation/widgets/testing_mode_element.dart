import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TestingModeElement extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String image;
  final String bg;

  const TestingModeElement({super.key, required this.title, required this.subTitle, required this.onTap, required this.image, required this.bg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Color(0xff045EC5).withOpacity(0.08), blurRadius: 9.3, spreadRadius: 0, offset: Offset(0.0, 4.0))],
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(bg), fit: BoxFit.cover),
        ),
        width: double.infinity,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.bold16s.copyWith(color: Color(0xFF1F2937), height: 1)),
                SizedBox(height: 6.h),
                Text(subTitle, style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
              ],
            ),
            Image.asset(image, height: 55.h, width: 84),
          ],
        ),
      ),
    );
  }
}

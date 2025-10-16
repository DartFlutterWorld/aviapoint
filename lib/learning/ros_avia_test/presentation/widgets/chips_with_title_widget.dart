import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipsWithTitleWidget extends StatelessWidget {
  const ChipsWithTitleWidget({super.key, required this.title, required this.colorBackground, required this.colorTitle});

  final String title;
  final Color colorBackground;
  final Color colorTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorBackground),
      child: Center(
        child: Text(title, style: AppStyles.mediumItalic12s.copyWith(color: colorTitle)),
      ),
    );
  }
}

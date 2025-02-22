import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/utils/const/theme.dart';

class AppStyles {
  static TextStyle subTextReg = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18.48 / 18,
  );
  static TextStyle tittleMainReg = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1,
  );
  static TextStyle subTextSemi = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    height: (18 / 14).sp,
  );
  static TextStyle subMid = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    height: (17.16 / 14).r,
  );
  static TextStyle subBignumb = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 18.48 / 14,
  );
  static TextStyle subNumb = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    height: (18.48 / 14).sp,
  );
  static TextStyle subBig = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1,
  );
  static TextStyle tittleShit = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 18 / 18,
  );
  static TextStyle subSmall = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 13.92 / 12,
  );
  static TextStyle subSmallSemi = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 15.08 / 13,
  );
  static TextStyle adress = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 21.79 / 16,
  );
  static TextStyle secondaryRowNumber = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 13.92 / 12,
  );
  static TextStyle mark = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 11.sp,
    height: (14.52 / 11).r,
  );

  static TextStyle rowLabel = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 18.6 / 15,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );
  static TextStyle warehous = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 18 / 13,
    letterSpacing: 0,
  );
  static TextStyle attention = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 17.16 / 13,
  );
  static TextStyle thin = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 9,
    height: 12.26 / 9,
    letterSpacing: -0.21,
  );
  static TextStyle button = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    height: 1,
  );
  static TextStyle bigButtonCulture = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1,
  );
  static TextStyle rowColor = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 18.6 / 15,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  static TextStyle tableRow = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 18.6 / 15,
    color: AppColors.textSecondary,
    letterSpacing: 0,
  );

  static TextStyle rowValue = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 18.6 / 15,
    color: AppColors.textSecondary,
    letterSpacing: 0,
  );
  static TextStyle price = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 18.6 / 15,
    color: AppColors.textSecondary,
    letterSpacing: -0.41,
  );
  static TextStyle measures = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20.43 / 15,
    color: AppColors.textSecondary,
    letterSpacing: 0,
  );

  static TextStyle caption = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14 / 12,
    color: AppColors.textTertiary,
    letterSpacing: 0,
  );
  static TextStyle subtitleSmall = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 15.08 / 13,
    letterSpacing: 0,
  );
  static TextStyle caption2 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 13.92 / 12,
    color: AppColors.textTertiary,
    letterSpacing: 0,
  );
  static TextStyle dialogBtn = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1,
    letterSpacing: 0,
  );
  static TextStyle rowNumber = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 13.92 / 12,
  );
  static TextStyle caption2thin = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 15.84 / 12,
    color: AppColors.textTertiary,
    letterSpacing: 0,
  );

  static TextStyle brogressBar = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 21,
    height: 1,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );

  static TextStyle inputValue = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 17.9 / 15,
    color: AppColors.textTertiary,
    letterSpacing: 0,
  );

  static TextStyle inputLabel = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 17.9 / 15,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );
  static TextStyle titleSmall = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1,
  );
  static TextStyle titleSmallSemi = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1,
  );
  static TextStyle titleSmallReg = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1,
  );

  static TextStyle title = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 26.4 / 20,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );
  static TextStyle titleNews = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    height: 22.44 / 17,
    color: AppColors.textPrimary,
  );
  static TextStyle dataNews = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 11.6 / 10,
    color: AppColors.netural40p,
  );
  static TextStyle titleTitleBig = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 31.68 / 20,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );
  static TextStyle titleBig = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
    height: (31.68 / 24).sp,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );
  static TextStyle titleMain = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 18 / 18,
  );
  static TextStyle newTitleMain = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 31.68 / 24,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );

  static TextStyle titleMidle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    height: 22.44 / 17,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );

  static TextStyle body1 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 15.08 / 13,
    color: AppColors.netural75p,
    letterSpacing: 0,
  );

  static TextStyle subMiddle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 17.16 / 13,
  );
  static TextStyle company = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 19.84 / 16,
    color: AppColors.netural75p,
    letterSpacing: 0,
  );

  static TextStyle buttonLabel = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );
  static TextStyle buttonBig = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1,
    letterSpacing: 0,
  );
  static TextStyle newButton = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1,
    letterSpacing: 0,
  );
  static TextStyle filter = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 18 / 18,
    letterSpacing: 0,
  );
  static TextStyle filterNumb = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 1,
  );

  static TextStyle filterTiny = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    height: 11.6 / 10,
    letterSpacing: 0,
  );

  static TextStyle appbarTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    height: 1.r,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  static TextStyle newTitleCulture = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1,
    letterSpacing: 0,
  );

  static TextStyle appbarAction = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );
  static TextStyle buttonCulture18 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1,
  );
  static TextStyle buttonCulture17 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 23.15 / 17,
  );

  static TextStyle subTitle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18.48 / 14,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );

  static TextStyle subTitleSmall = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18.48 / 14,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );

  static TextStyle subTitleSubMid = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 17.16 / 13,
    letterSpacing: 0,
  );

  static TextStyle newSubTitleMain = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18.48 / 14,
    color: AppColors.primary100p,
    letterSpacing: 0,
  );

  static TextStyle code = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    height: 1,
    color: AppColors.netural100p,
    letterSpacing: 0,
  );
  static TextStyle titleButton17buttonCulture = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 23.15 / 17,
  );
}

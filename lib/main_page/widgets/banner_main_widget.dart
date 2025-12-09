import 'dart:ui';

import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerMainWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;
  final String picture;
  final String background;
  final VoidCallback onTap;
  final String titleButton;
  final Color backgroundColorButton;
  final Color borderColorButton;
  final Color textColorButton;
  final AlignmentGeometry pictureAlign;

  const BannerMainWidget({
    super.key,
    required this.title,
    required this.description,
    required this.picture,
    required this.background,
    required this.onTap,
    required this.titleButton,
    required this.backgroundColorButton,
    required this.borderColorButton,
    required this.textColorButton,
    required this.titleColor,
    required this.descriptionColor,
    required this.pictureAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Container(
          height: 233.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Align(
                alignment: pictureAlign,
                child: Image.asset(picture, height: 150.h),
              ),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.bold20s.copyWith(color: titleColor),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.h),
                    Text(description, style: AppStyles.regular12s.copyWith(color: descriptionColor)),
                  ],
                ),
              ),

              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    verticalPadding: 8,
                    backgroundColor: backgroundColorButton,
                    title: titleButton,
                    textStyle: AppStyles.bold16s.copyWith(color: textColorButton),
                    borderColor: borderColorButton,
                    borderRadius: 46,
                    boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                    // onPressed: () => context.router.push(NewsNavigationRoute()),
                    onPressed: onTap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

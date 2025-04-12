import 'package:auto_size_text/auto_size_text.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BanerWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String titleButton;
  final VoidCallback? ontap;
  final Color background;
  final Color iconColor;
  final Color titleColor;
  final Color descColor;
  final Color borderColor;
  final Color buttonColor;
  final Color borderButtonColor;
  final Color titleButtonColor;
  final String picture;
  final String circleBackGround;

  const BanerWidget({
    Key? key,
    required this.title,
    required this.desc,
    required this.titleButton,
    required this.ontap,
    this.background = AppColors.primary20p,
    this.iconColor = AppColors.bgViolet,
    this.titleColor = AppColors.primary100p,
    this.descColor = AppColors.lightViolet3,
    this.borderColor = AppColors.primary40p,
    this.buttonColor = AppColors.bgViolet,
    this.borderButtonColor = const Color(0xFF825DEC),
    this.titleButtonColor = Colors.white,
    required this.picture,
    required this.circleBackGround,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff695CF8),
              Color(0xFF7A0FD9),
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(circleBackGround),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  picture,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (title.isNotEmpty)
                              AutoSizeText(
                                title,
                                style: AppStyles.titleBig.copyWith(color: AppColors.white),
                              ),
                            if (title.isNotEmpty) SizedBox(height: 4.h),
                            AutoSizeText(
                              desc,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                height: (15.4 / 14).sp,
                                color: AppColors.white,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12).r,
                      child: CustomButton(
                        title: titleButton,
                        verticalPadding: 12.h,
                        backgroundColor: AppColors.white,
                        onPressed: ontap,
                        borderRadius: 12.r,
                        textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp, height: 1, color: AppColors.mainSolid),
                        borderColor: AppColors.white,
                        boxShadow: [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

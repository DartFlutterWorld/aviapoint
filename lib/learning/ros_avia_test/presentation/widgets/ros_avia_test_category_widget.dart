import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RosAviaTestCategoryWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  final Widget? child;

  final VoidCallback? clearCategory;

  const RosAviaTestCategoryWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.child,
    this.clearCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(16.r),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 11, bottom: 11),
            decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE3F1FF), width: 1), borderRadius: BorderRadius.all(Radius.circular(16.r)), color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0xFF045EC5).withOpacity(0.08),
                blurRadius: 9.3,
                offset: Offset(
                  0.0,
                  4.0,
                ),
              ),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        title,
                        style: AppStyles.semibpld14s.copyWith(
                          color: Color(0xFF374151),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                // SizedBox(height: 4.h),
                Text(subTitle, style: AppStyles.regular13s.copyWith(color: Color(0xFF6E7A89))),
                if (child != null) child!,
              ],
            ),
          ),
          Align(alignment: Alignment.topRight, child: SvgPicture.asset(Pictures.lableArrowRight)),
        ],
      ),
    );
  }
}

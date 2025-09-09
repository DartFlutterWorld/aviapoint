import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourSpecializationWidget extends StatelessWidget {
  final String specialization;
  final int topics;
  final VoidCallback onTap;
  const YourSpecializationWidget({
    super.key,
    required this.specialization,
    required this.topics,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFE3F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.08),
            blurRadius: 4.0,
            offset: Offset(
              0.0,
              4.0,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ваша специализация',
                style: AppStyles.medium14s.copyWith(
                  color: Color(0xFF223B76),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Row(
                  children: [
                    Text(
                      'Всего:',
                      style: AppStyles.medium10s.copyWith(
                        color: Color(0xFF374151),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$topics тем',
                      style: AppStyles.medium10s.copyWith(
                        color: Color(0xFF0A6EFA),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      specialization,
                      style: AppStyles.regular14s.copyWith(
                        color: Color(0xFF4B5767),
                      ),
                    ),
                  ),
                  SvgPicture.asset(Pictures.arrowDown)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

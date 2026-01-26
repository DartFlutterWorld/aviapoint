import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckboxWithTitle extends StatelessWidget {
  final VoidCallback onToggleMixAnswers;
  final VoidCallback onToggleMixQuestions;
  final VoidCallback onToggleButtonHint;
  final bool isSelectMixAnswers;
  final bool isSelectMixQuestions;
  final bool isSelectButtonHint;

  const CheckboxWithTitle({
    super.key,
    required this.isSelectMixAnswers,
    required this.isSelectMixQuestions,
    required this.isSelectButtonHint,
    required this.onToggleMixAnswers,
    required this.onToggleButtonHint,
    required this.onToggleMixQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: const Color(0xFF000000).withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Настройки', style: AppStyles.medium14s.copyWith(color: const Color(0xFF223B76)))],
          ),
          SizedBox(height: 14.h),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onToggleMixAnswers,
                      child: Row(
                        children: [
                          SvgPicture.asset(isSelectMixAnswers ? Pictures.checkBoxActive : Pictures.checkBox),
                          SizedBox(width: 8.w),
                          Text(
                            'Перемешать ответы',
                            style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleButtonHint,
                      child: Row(
                        children: [
                          SvgPicture.asset(isSelectButtonHint ? Pictures.checkBoxActive : Pictures.checkBox),
                          SizedBox(width: 8.w),
                          Text(
                            'Кнопка с подсказкой',
                            style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onToggleMixQuestions,
                      child: Row(
                        children: [
                          SvgPicture.asset(isSelectMixQuestions ? Pictures.checkBoxActive : Pictures.checkBox),
                          SizedBox(width: 8.w),
                          Text(
                            'Перемешать вопросы',
                            style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

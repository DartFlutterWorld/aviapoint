import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Виджет для выбора доли продажи (например, 1/2, 2/3, 3/4, 4/5)
class SharePickerWidget extends StatelessWidget {
  final int? numerator;
  final int? denominator;
  final ValueChanged<int?>? onNumeratorChanged;
  final ValueChanged<int?>? onDenominatorChanged;

  const SharePickerWidget({
    super.key,
    this.numerator,
    this.denominator,
    this.onNumeratorChanged,
    this.onDenominatorChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Доступные значения для числителя (1-10)
    final numeratorOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    // Доступные значения для знаменателя (1-10), но фильтруем чтобы знаменатель был больше числителя
    final allDenominatorOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final denominatorOptions = numerator != null
        ? allDenominatorOptions.where((d) => d > numerator!).toList()
        : allDenominatorOptions;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Числитель
        Container(
          width: 60.w,
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFE5E7EB)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: numerator,
              isExpanded: true,
              alignment: Alignment.center,
              hint: Text(
                '-',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
              ),
              items: numeratorOptions.map((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  alignment: Alignment.center,
                  child: Text(
                    value.toString(),
                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
              onChanged: onNumeratorChanged,
              icon: Icon(Icons.arrow_drop_down, size: 20, color: Color(0xFF9CA5AF)),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        // Разделитель "/"
        Text(
          '/',
          style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
        ),
        SizedBox(width: 8.w),
        // Знаменатель
        Container(
          width: 60.w,
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFE5E7EB)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: denominator,
              isExpanded: true,
              alignment: Alignment.center,
              hint: Text(
                '-',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
              ),
              items: denominatorOptions.map((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  alignment: Alignment.center,
                  child: Text(
                    value.toString(),
                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
              onChanged: onDenominatorChanged,
              icon: Icon(Icons.arrow_drop_down, size: 20, color: Color(0xFF9CA5AF)),
            ),
          ),
        ),
      ],
    );
  }
}
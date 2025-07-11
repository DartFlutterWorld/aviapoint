import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 52,
  height: 65,
  textStyle: AppStyles.code.copyWith(
    color: AppColors.textPrimary,
  ),
  decoration: const BoxDecoration(
    color: AppColors.white,
    border: Border.fromBorderSide(BorderSide(color: AppColors.grey14)),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final disabledPinTheme = defaultPinTheme.copyWith(
  textStyle: AppStyles.code.copyWith(
    color: AppColors.textPrimary.withValues(alpha: .4),
  ),
);

final focusedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    border: const Border.fromBorderSide(BorderSide(color: Color(0xFFFFD362))),
  ),
);

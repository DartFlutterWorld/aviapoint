import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 58,
  height: 71,
  textStyle: AppStyles.extraBold.copyWith(color: Color(0xFF2B373E)),
  decoration: const BoxDecoration(color: Color(0xFFE3F1FF), borderRadius: BorderRadius.all(Radius.circular(12))),
);

final disabledPinTheme = defaultPinTheme.copyWith();

final focusedPinTheme = defaultPinTheme.copyWith(
  decoration: const BoxDecoration(
    color: Color(0xFFE3F1FF),
    border: Border.fromBorderSide(BorderSide(color: Color(0xFF0A6EFA))),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);

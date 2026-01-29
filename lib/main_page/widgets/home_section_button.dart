import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

/// Универсальная кнопка для секций на главном экране (Маркет / Блог / Новости и т.п.)
class HomeSectionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const HomeSectionButton({super.key, required this.title, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final adaptiveBold16s = AppStyles.adaptiveTextStyle(context, AppStyles.bold16s, baseSize: 16);

    return CustomButton(
      // verticalPadding: 0,
      backgroundColor: color,
      title: title,
      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
      borderColor: color,
      borderRadius: 46,
      boxShadow: [BoxShadow(color: color.withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 4))],
      onPressed: onPressed,
    );
  }
}

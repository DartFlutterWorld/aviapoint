import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CorrectAnswer extends StatelessWidget {
  final Color color;
  final Color colorTitle;
  final String title;
  const CorrectAnswer({super.key, required this.color, required this.title, required this.colorTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
      child: Text(title, style: AppStyles.mediumItalic12s.copyWith(color: colorTitle)),
    );
  }
}

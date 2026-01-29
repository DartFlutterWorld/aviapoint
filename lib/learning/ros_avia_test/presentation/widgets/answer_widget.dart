import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String icon;
  const AnswerWidget({super.key, required this.backgroundColor, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          spacing: 6,
          children: [
            SvgPicture.asset(icon, width: 16, height: 16),
            Flexible(
              child: Text(title, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
            ),
          ],
        ),
      ),
    );
  }
}

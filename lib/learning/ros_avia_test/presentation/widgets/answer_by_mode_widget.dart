import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerByModeWidget extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;

  const AnswerByModeWidget({
    super.key,
    required this.backgroundColor,
    required this.title,
    this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
    this.showResult = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.transparent;
    Color displayBackgroundColor = backgroundColor;

    // Логика для отображения цветов в зависимости от статуса
    if (showResult && isCorrect) {
      // Правильный ответ - зеленый фон
      displayBackgroundColor = Color(0xFFC4F4E1);
    } else if (isSelected) {
      // Выбранный ответ - голубая рамка (и правильный он или нет)
      borderColor = Color(0xFFBCD9FE);
      if (!isCorrect && showResult) {
        // Неправильный выбранный ответ - светлый фон с голубой рамкой
        displayBackgroundColor = Color(0xFFF1F7FF);
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: displayBackgroundColor,
          border: Border.all(color: borderColor, width: borderColor != Colors.transparent ? 2 : 0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            spacing: 8,
            children: [
              if (showResult && isCorrect) SvgPicture.asset(Pictures.isCorrect, width: 20, height: 20),
              Flexible(
                child: Text(title, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

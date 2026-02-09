import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';

class SelectTopicsWarningDialog extends StatelessWidget {
  const SelectTopicsWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: 313,
      height: 195,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Выберите хотя бы 1 тему для тестирования',
            style: AppStyles.bold16s.copyWith(color: Color(0xFF223B76)),
            textAlign: TextAlign.center,
          ),
          Image.asset(Pictures.planeProgress, height: 76),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomButton(
                  verticalPadding: 4,
                  backgroundColor: Color(0xFF0A6EFA),
                  title: 'Понятно',
                  textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  borderColor: Color(0xFF0A6EFA),
                  borderRadius: 46,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff0064D6).withOpacity(0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0.0, 7.0),
                    ),
                  ],
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

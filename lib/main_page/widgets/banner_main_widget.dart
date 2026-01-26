import 'dart:ui';

import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerMainWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;
  final String picture;
  final String background;
  final VoidCallback onTap;
  final String titleButton;
  final Color backgroundColorButton;
  final Color borderColorButton;
  final Color textColorButton;
  final AlignmentGeometry pictureAlign;

  const BannerMainWidget({
    super.key,
    required this.title,
    required this.description,
    required this.picture,
    required this.background,
    required this.onTap,
    required this.titleButton,
    required this.backgroundColorButton,
    required this.borderColorButton,
    required this.textColorButton,
    required this.titleColor,
    required this.descriptionColor,
    required this.pictureAlign,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = kIsWeb ? 18.0 : 18.r;
    final padding = kIsWeb ? 14.0 : 14.w;
    final spacing = kIsWeb ? 5.0 : 5.h;
    final bottomPos = kIsWeb ? 12.0 : 12.h;
    final horizontalPos = kIsWeb ? 12.0 : 12.w;
    final buttonPadding = kIsWeb ? 8.0 : 8.h;
    final buttonRadius = kIsWeb ? 46.0 : 46.r;
    final shadowBlur = kIsWeb ? 4.0 : 4.r;
    final shadowOffset = kIsWeb ? 7.0 : 7.h;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // Убираем фиксированную высоту - пусть GridView определяет размер
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  // Используем процент от доступной высоты контейнера для адаптации к размеру GridView
                  // В портрете контейнер ниже, в ландшафте выше, но картинка будет пропорциональна
                  final imageHeight = constraints.maxHeight * 0.7; // 40% от высоты контейнера
                  return Align(
                    alignment: pictureAlign,
                    child: Image.asset(
                      picture,
                      height: imageHeight,
                      fit: BoxFit.contain, // Сохраняет пропорции изображения
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Минимальный размер колонки
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp, height: 1, color: titleColor),
                        style: AppStyles.bold16s.copyWith(color: titleColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: spacing),
                    Flexible(
                      child: Text(description, style: AppStyles.regular12s.copyWith(color: descriptionColor)),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: bottomPos,
                left: horizontalPos,
                right: horizontalPos,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    verticalPadding: buttonPadding,
                    backgroundColor: backgroundColorButton,
                    title: titleButton,
                    textStyle: AppStyles.bold16s.copyWith(color: textColorButton),
                    borderColor: borderColorButton,
                    borderRadius: buttonRadius,
                    boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: shadowBlur, spreadRadius: 0, offset: Offset(0.0, shadowOffset))],
                    onPressed: onTap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

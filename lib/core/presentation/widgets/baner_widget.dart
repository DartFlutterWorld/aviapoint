import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class BanerWidget extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final TextStyle descStyle;
  final TextStyle titleButtonStyle;
  final TextStyle titleButtonStyle2;
  final String desc;
  final String titleButton;
  final String? titleButton2;
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  final String background;
  final Color? backgroundColor;
  final Color? backgroundColor2;
  final String picture;
  final AlignmentGeometry alignPicture;
  final double? heightPicture;
  final Color borderColor;
  final Color borderColor2;
  final List<BoxShadow>? boxShadowContainer;
  final List<BoxShadow>? boxShadowButton;
  final List<BoxShadow>? boxShadowButton2;

  const BanerWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.titleButton,
    required this.onTap,
    required this.background,
    required this.picture,
    required this.alignPicture,
    this.heightPicture = 134,
    this.titleButton2,
    this.onTap2,
    this.titleButtonStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0A6EFA)),
    this.titleButtonStyle2 = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    this.backgroundColor = Colors.white,
    this.backgroundColor2 = const Color(0xFF0A6EFA),
    this.borderColor = Colors.white,
    this.borderColor2 = const Color(0xFF0A6EFA),
    this.boxShadowContainer = const [BoxShadow(color: Color(0xff045EC5), blurRadius: 9.3, spreadRadius: 0, offset: Offset(0.0, 4.0))],
    this.boxShadowButton = const [BoxShadow(color: Color(0xff045EC5), blurRadius: 9.3, spreadRadius: 0, offset: Offset(0.0, 4.0))],
    this.boxShadowButton2 = const [BoxShadow(color: Color(0xff045EC5), blurRadius: 9.3, spreadRadius: 0, offset: Offset(0.0, 4.0))],
    this.titleStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
    this.descStyle = const TextStyle(fontWeight: FontWeight.normal, fontSize: 13, height: 1.3, color: Color(0xFFF1F7FF)),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(background), isAntiAlias: true),
          boxShadow: boxShadowContainer,
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: alignPicture,
                child: Image.asset(picture, fit: BoxFit.contain, height: heightPicture ?? 150),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (title.isNotEmpty) Text(title, style: titleStyle),
                            if (title.isNotEmpty) SizedBox(height: 4),
                            Text(desc, style: descStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 8,
                    children: [
                      Flexible(
                        child: CustomButton(
                          title: titleButton,
                          verticalPadding: 8,
                          backgroundColor: backgroundColor,
                          onPressed: onTap,
                          borderRadius: 46,
                          textStyle: titleButtonStyle,
                          borderColor: borderColor,
                          boxShadow: boxShadowButton,
                        ),
                      ),
                      if (titleButton2 != null)
                        Flexible(
                          child: CustomButton(
                            title: titleButton2!,
                            verticalPadding: 8,
                            backgroundColor: backgroundColor2,
                            onPressed: onTap2,
                            borderRadius: 46,
                            textStyle: titleButtonStyle2,
                            borderColor: borderColor2,
                            boxShadow: boxShadowButton2,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

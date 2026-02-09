import 'dart:ui' show VoidCallback;

import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryHandBookLongWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String picturePlane;
  final String background;
  final double imageHeight;
  final VoidCallback onTap;
  const CategoryHandBookLongWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.picturePlane,
    required this.background,
    required this.imageHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Color(0xFF045EC5).withOpacity(0.08), blurRadius: 9.3, offset: Offset(0.0, 4.0)),
              ],
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(background)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [Image.asset(picturePlane, height: imageHeight, alignment: Alignment.centerLeft)],
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: Text(title, style: AppStyles.bold15s.copyWith(color: Color(0xFF1F2937), height: 1)),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: Text(
                              subTitle,
                              style: AppStyles.regular13s.copyWith(color: Color(0xFF4B5767), height: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(bottom: 8, right: 11, child: SvgPicture.asset(Pictures.book)),
        ],
      ),
    );
  }
}

import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool isSelect;

  final Widget? child;

  final VoidCallback? clearCategory;
  final bool withClear;
  final String? image;

  const CategoryWidget({super.key, required this.title, required this.onTap, required this.subTitle, this.child, this.clearCategory, this.withClear = true, this.image, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 11, bottom: 11),
            decoration: BoxDecoration(
              border: Border.all(color: isSelect ? Color(0xFF0A6EFA) : const Color(0xFFE3F1FF), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Color(0xFF045EC5).withOpacity(0.08), blurRadius: 9.3, offset: Offset(0.0, 4.0))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    if (image != null) Padding(padding: const EdgeInsets.only(right: 10), child: SvgPicture.asset(image!)),
                    Expanded(
                      flex: 5,
                      child: Text(title, style: AppStyles.bold15s.copyWith(color: Color(0xFF374151))),
                    ),
                    SizedBox(width: 8),
                    if (withClear)
                      GestureDetector(
                        onTap: clearCategory,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              SvgPicture.asset(Pictures.refresh),
                              SizedBox(width: 2),
                              Text(
                                'Сбросить',
                                style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA)),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                // SizedBox(height: 4),
                if (subTitle.isNotEmpty) Text(subTitle, style: AppStyles.regular13s.copyWith(color: Color(0xFF6E7A89))),
                if (child != null) child!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

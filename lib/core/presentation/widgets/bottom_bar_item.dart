import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

class BottomBarItem extends StatelessWidget {
  final String icon;
  final String text;
  final Color activeColor;
  final Color textColor;
  final void Function() onPressed;
  final bool isActive;

  const BottomBarItem({super.key, required this.icon, required this.text, required this.activeColor, required this.textColor, required this.onPressed, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: isActive
          //     ? [
          //         BoxShadow(
          //           color: Color(0xff000000).withOpacity(0.25),
          //           blurRadius: 4,
          //           spreadRadius: 0,
          //           offset: Offset(
          //             0.0,
          //             4.0,
          //           ),
          //         ),
          //       ]
          //     : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(icon, height: 24),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

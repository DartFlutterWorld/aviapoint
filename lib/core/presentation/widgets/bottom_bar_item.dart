import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  final String? icon;
  final IconData? iconData;
  final String text;
  final Color activeColor;
  final Color textColor;
  final void Function() onPressed;
  final bool isActive;

  const BottomBarItem({
    super.key,
    this.icon,
    this.iconData,
    required this.text,
    required this.activeColor,
    required this.textColor,
    required this.onPressed,
    required this.isActive,
  }) : assert(icon != null || iconData != null, 'Either icon or iconData must be provided');

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
                icon != null
                    ? SvgPicture.asset(icon!, height: 24, colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn))
                    : Icon(iconData!, size: 24, color: textColor),
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

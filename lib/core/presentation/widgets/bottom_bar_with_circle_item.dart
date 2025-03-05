import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

class BottomBarWithCircleItem extends StatelessWidget {
  final String icon;
  final String text;
  final Color colors;
  final void Function() onPressed;

  const BottomBarWithCircleItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.colors,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                height: 24,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: AppStyles.subSmall.copyWith(color: colors),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDataWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const ProfileDataWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10),
          Text(title, style: AppStyles.regular14s.copyWith(color: Color(0xFF6E7A89))),
          Spacer(),
          SvgPicture.asset(Pictures.arrowRight),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Маркет',
        withBack: false,
        actions: [
          Provider.of<AppState>(context, listen: true).isAuthenticated
              ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
              : IconButton(
                  onPressed: () => showLogin(context, callback: () => AutoRouter.of(context).navigate(const ProfileNavigationRoute())),
                  icon: Icon(Icons.login),
                ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы можете продать или купить авиатехнику или запчасти к ней',
              style: AppStyles.bold20s.copyWith(color: Color(0xFF2B373E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              'Маркет скоро появится в приложении, свяжитесь с нами и оставьте заявку на продажу или покупку',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF2B373E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Image.asset(Pictures.zapp),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: 147.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(color: Color(0xFFD5FDD8), borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Pictures.whatsapp),
                        SizedBox(width: 6.w),
                        Text('Whatsapp', style: AppStyles.bold16s.copyWith(color: Color(0xFF01B40E))),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Flexible(
                  child: Container(
                    width: 147.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(color: Color(0xFFD0F2FF), borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Pictures.telegramm),
                        SizedBox(width: 6.w),
                        Text('Telegram', style: AppStyles.bold16s.copyWith(color: Color(0xFF008EC3))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

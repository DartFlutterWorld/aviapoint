import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Главная',
        withBack: false,
        actions: [
          Provider.of<AppState>(context, listen: true).isAuthenticated
              ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
              : IconButton(
                  onPressed: () => showLogin(
                    context,
                    callback: () => AutoRouter.of(context).navigate(const ProfileNavigationRoute()),
                  ),
                  icon: Icon(Icons.login),
                )
        ],
      ),
      backgroundColor: AppColors.newbg,
      body: Center(child: Text('news')),
    );
  }
}

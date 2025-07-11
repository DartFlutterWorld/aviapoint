import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
      BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Профиль',
          withBack: false,
          // backgroundColor: AppColors.newbg,
          actions: [
            Provider.of<AppState>(context, listen: true).isAuthenticated
                ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
                : IconButton(
                    onPressed: () => showLogin(context),
                    icon: Icon(Icons.login),
                  )
          ],
        ),
        backgroundColor: AppColors.newbg,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Text(
              Provider.of<AppState>(context, listen: true).isAuthenticated ? 'Вы авторизованы' : 'Вы не авторизованы',
              textAlign: TextAlign.center,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) => state.map(
                      success: (state) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.profile.id.toString()),
                            Text(state.profile.firstName ?? ''),
                            Text(state.profile.lastName ?? ''),
                            Text(state.profile.phone),
                            Text(state.profile.email ?? ''),
                          ],
                        ),
                      ),
                      loading: (state) => const Center(child: CircularProgressIndicator()),
                      initial: (state) => SizedBox(),
                      error: (state) => Text(state.errorForUser),
                    )),
          ],
        ),
      ),
    );
  }
}

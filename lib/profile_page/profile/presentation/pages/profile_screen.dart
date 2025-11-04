import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          // backgroundColor: AppColors.background,
          actions: [
            Provider.of<AppState>(context, listen: true).isAuthenticated
                ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
                : IconButton(onPressed: () => showLogin(context), icon: Icon(Icons.login)),
          ],
        ),
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Provider.of<AppState>(context, listen: true).isAuthenticated
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Image.asset(Pictures.pilot, height: 63, width: 63),
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) => state.map(
                                success: (state) => Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${state.profile.firstName ?? ''} ${state.profile.lastName ?? ''}', style: AppStyles.bold16s.copyWith(color: Color(0xFF2B373E))),
                                      Text(state.profile.phone, style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                                      Text(state.profile.email ?? '', style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767))),
                                    ],
                                  ),
                                ),
                                error: (state) => ErrorCustom(
                                  textError: state.errorForUser,
                                  repeat: () {
                                    if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
                                      BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
                                    }
                                  },
                                ),
                                loading: (state) => LoadingCustom(),
                                initial: (state) => SizedBox(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Кнопка очистки БД
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Очистить прогресс?'),
                                content: Text('Это удалит все сохраненные сессии тестирования и прогресс. Это действие нельзя отменить.'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Отмена')),
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(ctx);
                                      await getIt<AppDb>().clearAllData();
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Прогресс очищен')));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                    child: Text('Очистить', style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.delete_outline),
                          label: Text('Очистить прогресс'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.1), foregroundColor: Colors.red),
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Pictures.planeProfile, height: 374, width: 286),
                        SizedBox(height: 16),
                        CustomButton(
                          verticalPadding: 8,
                          backgroundColor: Color(0xFF0A6EFA),
                          title: 'Войти в профиль',
                          textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                          borderColor: Color(0xFF0A6EFA),
                          borderRadius: 46,
                          boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                          onPressed: () => showLogin(context),
                        ),
                      ],
                    ),
              // Переключатель сервера
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Сервер', style: AppStyles.bold14s),
                        Text(
                          Provider.of<AppState>(context, listen: true).useLocalServer ? 'Локальный (локалхост)' : 'Удаленный (production)',
                          style: AppStyles.regular12s.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Switch(
                      value: Provider.of<AppState>(context, listen: true).useLocalServer,
                      onChanged: (value) {
                        Provider.of<AppState>(context, listen: false).setUseLocalServer(value);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(value ? 'Переключился на локальный сервер' : 'Переключился на удаленный сервер'), duration: Duration(seconds: 2)));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

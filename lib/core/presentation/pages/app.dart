import 'package:aviapoint/core/domain/service_locator.dart';
import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Корень приложения.
@immutable
class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  // final _init = AppState(
  //   settingsRepository: ServiceLocator.instance.get<SettingsRepository>(),
  //   authRepository: ServiceLocator.instance.get<AuthRepository>(),
  //   pushRepository: ServiceLocator.instance.get<PushRepository>(),
  // );

  final _init = ServiceLocator.instance.get<AppState>();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _init),
      ],
      child: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          profileRepository: ServiceLocator.instance.get<ProfileRepository>(),
          initState: _init,
        ),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is LoadingProfileState) {
              //context.read<OrdersSummaryBloc>().emit(LoadingOrdersSummaryState());
            }
          },
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'ЦЕНА ЗЕРНА',
            routerDelegate: ServiceLocator.instance.get<AppRouter>().delegate(
                  navigatorObservers: () => [HeroController(), MyRouteObserver()],
                ),
            routeInformationParser: ServiceLocator.instance.get<AppRouter>().defaultRouteParser(),
            // routerConfig: ServiceLocator.instance.get<AppRouter>().config(),
          ),
        ),
      ),
    );
  }
}

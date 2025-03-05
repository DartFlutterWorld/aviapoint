import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/bloc/hand_book_main_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/bloc/video_for_students_bloc.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

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

  // Получаем зависимости через get_it
  final _init = getIt<AppState>();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _init),
        BlocProvider<VideoForStudentsBloc>(
          create: (context) => VideoForStudentsBloc(
            videoForStudentsRepository: getIt<VideoForStudentsRepository>(),
          ),
        ),
        BlocProvider<HandBookMainCategoriesBloc>(
          create: (context) => HandBookMainCategoriesBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
        BlocProvider<PreflightInspectionCategoriesBloc>(
          create: (context) => PreflightInspectionCategoriesBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
      ],
      child: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          profileRepository: getIt<ProfileRepository>(),
          initState: _init,
        ),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is LoadingProfileState) {
              // context.read<OrdersSummaryBloc>().emit(LoadingOrdersSummaryState());
            }
          },
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'AviaPoint',
            routerDelegate: getIt<AppRouter>().delegate(
              navigatorObservers: () => [MyRouteObserver()],
            ),
            routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
          ),
        ),
      ),
    );
  }
}

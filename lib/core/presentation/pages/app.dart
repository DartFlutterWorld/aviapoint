import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/bloc/sms_bloc.dart';
import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/bloc/emergency_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/bloc/hand_book_main_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/bloc/normal_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/presentation/bloc/video_for_students_bloc.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

/// Корень приложения.
@immutable
class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  // Получаем зависимости через get_it

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          create: (context) => getIt<AppState>(),
        ),
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
        BlocProvider<PreflightInspectionCheckListByCategoryBloc>(
          create: (context) => PreflightInspectionCheckListByCategoryBloc(
            handBookRepository: getIt<HandBookRepository>(),
            preflightCheckedCubit: getIt<PreflightCheckedCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider<PreflightInspectionCheckListBloc>(
          create: (context) => PreflightInspectionCheckListBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
        BlocProvider<PreflightCheckedCubit>(
          create: (context) => getIt<PreflightCheckedCubit>(),
        ),
        BlocProvider<NormalCategoriesBloc>(
          create: (context) => NormalCategoriesBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
        BlocProvider<NormalCheckListByCategoryBloc>(
          create: (context) => NormalCheckListByCategoryBloc(
            handBookRepository: getIt<HandBookRepository>(),
            normalCheckedCubit: getIt<NormalCheckedCubit>(),
          ),
          lazy: false,
        ),
        BlocProvider<NormalCheckListBloc>(
          create: (context) => NormalCheckListBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
        BlocProvider<NormalCheckedCubit>(
          create: (context) => getIt<NormalCheckedCubit>(),
        ),
        BlocProvider<EmergencyCategoriesBloc>(
          create: (context) => EmergencyCategoriesBloc(
            handBookRepository: getIt<HandBookRepository>(),
          ),
        ),
        BlocProvider<SmsBloc>(
          create: (context) => SmsBloc(authRepository: getIt<AuthRepository>()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: getIt<AuthRepository>(), appState: getIt<AppState>()),
        ),
      ],
      child: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          profileRepository: getIt<ProfileRepository>(),
          initState: getIt<AppState>(),
        ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'AviaPoint',
          routerDelegate: getIt<AppRouter>().delegate(
            navigatorObservers: () => [MyRouteObserver()],
          ),
          routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
        ),
      ),
    );
  }
}

import 'package:aviapoint/auth_page/data/datasources/remote/auth_service.dart';
import 'package:aviapoint/auth_page/data/repositories/auth_repository_impl.dart';
import 'package:aviapoint/auth_page/domain/repositories/auth_repository.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/learning/hand_book/datasources/hand_book_service.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository_impl.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';
import 'package:aviapoint/learning/video_for_students_page/data/datasources/video_for_students_service.dart';
import 'package:aviapoint/learning/video_for_students_page/data/repositories/video_for_students_repository_impl.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';
import 'package:aviapoint/profile_page/profile/data/datasources/profile_service.dart';
import 'package:aviapoint/profile_page/profile/data/repositories/profile_repository_impl.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final appRouter = AppRouter();
  final dataSource = ApiDatasourceDio(baseUrl: '$backUrl');

  // Регистрируем ApiDatasource и другие зависимости, которые не зависят от AuthRepository
  getIt.registerSingleton<ApiDatasource>(dataSource);
  getIt.registerSingleton<AppRouter>(appRouter);
  getIt.registerSingleton<MyRouteObserver>(MyRouteObserver());

  // Сначала регистрируем AuthRepository
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authService: AuthService(dataSource.dio),
      apiDatasource: getIt.get<ApiDatasource>(),
    ),
  );

  // Теперь создаём AppState, используя зарегистрированный AuthRepository
  final appState = AppState(authRepository: getIt<AuthRepository>());
  getIt.registerSingleton<AppState>(appState);

  // Регистрируем остальные зависимости
  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(
      profileService: ProfileService(dataSource.dio),
    ),
  );

  getIt.registerSingleton<VideoForStudentsRepository>(
    VideoForStudentsRepositoryImpl(
      videoForStudentsService: VideoForStudentsService(dataSource.dio),
    ),
  );

  getIt.registerSingleton<HandBookRepository>(
    HandBookRepositoryImpl(
      handBookService: HandBookService(dataSource.dio),
    ),
  );

  getIt.registerSingleton<DefaultCacheManager>(
    DefaultCacheManager(),
  );
  getIt.registerSingleton<PreflightCheckedCubit>(
    PreflightCheckedCubit(),
  );
  getIt.registerSingleton<NormalCheckedCubit>(
    NormalCheckedCubit(),
  );
}

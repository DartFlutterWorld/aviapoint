import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/routes/route_observer.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/learning/hand_book/datasources/hand_book_service.dart';
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

  final AppState appState = AppState();

  // Регистрация зависимостей через get_it
  getIt.registerSingleton<AppState>(appState);
  getIt.registerSingleton<AppRouter>(appRouter);
  getIt.registerSingleton<MyRouteObserver>(MyRouteObserver());
  getIt.registerSingleton<ApiDatasource>(dataSource);

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
}

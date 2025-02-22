import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/domain/service_locator.dart';
import 'package:aviapoint/core/presentation/widgets/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/profile_page/profile/data/datasources/profile_service.dart';
import 'package:aviapoint/profile_page/profile/data/repositories/profile_repository_impl.dart';
import 'package:aviapoint/profile_page/profile/domain/repositories/profile_repository.dart';

Future<void> setupDependencies() async {
  final appRouter = AppRouter();

  final dataSource = ApiDatasourceDio(baseUrl: '$backUrl');

  final AppState appState = AppState();

  ServiceLocator.instance.set<AppState>(appState);
  ServiceLocator.instance.set<AppRouter>(appRouter);
  ServiceLocator.instance.set<ApiDatasource>(dataSource);

  ServiceLocator.instance.set<ProfileRepository>(ProfileRepositoryImpl(
    profileService: ProfileService(dataSource.dio),
  ));
}

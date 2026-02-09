import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'checko_service.g.dart';

@RestApi()
abstract class CheckoService {
  factory CheckoService(Dio dio) = _CheckoService;

  @GET('/api/checko/by-inn')
  Future<dynamic> getByInn(@Query('inn') String inn);
}

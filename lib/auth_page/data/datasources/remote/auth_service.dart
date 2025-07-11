import 'package:aviapoint/auth_page/data/models/auth_dto.dart';
import 'package:aviapoint/auth_page/data/models/sms_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/auth/sms')
  Future<SmsDto> getSms(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/login')
  Future<AuthDto> auth(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/refresh')
  Future<AuthDto> refreshToken(
    @Body() Map<String, dynamic> body,
  );
}

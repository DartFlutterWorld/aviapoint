import 'package:aviapoint/profile_page/profile/data/models/profile_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('/api/profiles')
  Future<List<ProfileDto>> fetchProfilesList();

  @POST('/api/profile')
  Future<ProfileDto> fetchProfile(
    // @Body() Map<String, dynamic> body,
  );
}

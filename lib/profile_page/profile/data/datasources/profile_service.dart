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

  @PUT('/api/profile')
  Future<ProfileDto> updateProfile(@Body() Map<String, dynamic> body);

  @POST('/api/profile/photo')
  @MultiPart()
  Future<ProfileDto> uploadProfilePhoto(@Part(name: 'photo') MultipartFile photo);

  @POST('/api/profile/fcm-token')
  Future<void> saveFcmToken(@Body() Map<String, dynamic> body);

  @DELETE('/api/profile')
  Future<void> deleteAccount();
}

import 'package:aviapoint/learning/video_for_students_page/data/models/video_for_students_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'video_for_students_service.g.dart';

@RestApi()
abstract class VideoForStudentsService {
  factory VideoForStudentsService(Dio dio) = _VideoForStudentsService;

  @GET('/learning/video_for_students')
  Future<List<VideoForStudentsDto>> fetchVideosForStudents();

  @GET('/learning/video_for_students/{id}')
  Future<VideoForStudentsDto> fetchVideoById(@Path('id') int id);
}

import 'package:aviapoint/main_page/stories/data/models/story_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'story_service.g.dart';

@RestApi()
abstract class StoryService {
  factory StoryService(Dio dio) = _StoryService;

  @GET('/stories')
  Future<List<StoryDto>> getStories();

  @GET('/stories/{id}')
  Future<StoryDto> getStory(@Path('id') int id);
}

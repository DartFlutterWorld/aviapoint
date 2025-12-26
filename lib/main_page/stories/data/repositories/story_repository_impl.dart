import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/main_page/stories/data/datasources/story_service.dart';
import 'package:aviapoint/main_page/stories/data/repositories/mappers/story_mapper.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StoryRepositoryImpl extends StoryRepository {
  final StoryService _storyService;

  StoryRepositoryImpl({required StoryService storyService}) : _storyService = storyService;

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async {
    try {
      final response = await _storyService.getStories();

      return right(StoryMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, StoryEntity>> getStory({required int id}) async {
    try {
      final response = await _storyService.getStory(id);

      return right(StoryMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }
}

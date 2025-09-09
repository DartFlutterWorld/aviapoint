import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:aviapoint/main_page/stories/domain/entities/story_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories();

  Future<Either<Failure, StoryEntity>> getStory({required int id});
}

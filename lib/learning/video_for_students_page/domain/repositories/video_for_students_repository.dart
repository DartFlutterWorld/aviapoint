import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/entities/video_for_students_entity.dart';

import 'package:dartz/dartz.dart';

abstract class VideoForStudentsRepository {
  /// Получение видеозаписей для студентов.
  Future<Either<Failure, List<VideoForStudentsEntity>>> fetchVideosForStudents();
  Future<Either<Failure, VideoForStudentsEntity>> fetchVideoById(int id);
}

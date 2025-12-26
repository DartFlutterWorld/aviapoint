import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/video_for_students_page/data/datasources/video_for_students_service.dart';
import 'package:aviapoint/learning/video_for_students_page/data/mappers/video_for_students_mapper.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/entities/video_for_students_entity.dart';
import 'package:aviapoint/learning/video_for_students_page/domain/repositories/video_for_students_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VideoForStudentsRepositoryImpl extends VideoForStudentsRepository {
  final VideoForStudentsService _videoForStudentsService;

  VideoForStudentsRepositoryImpl({required VideoForStudentsService videoForStudentsService})
    : _videoForStudentsService = videoForStudentsService;

  @override
  Future<Either<Failure, List<VideoForStudentsEntity>>> fetchVideosForStudents() async {
    try {
      final response = await _videoForStudentsService.fetchVideosForStudents();

      return right(VideoForStudentsMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, VideoForStudentsEntity>> fetchVideoById(int id) async {
    try {
      final response = await _videoForStudentsService.fetchVideoById(id);

      return right(VideoForStudentsMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }
}

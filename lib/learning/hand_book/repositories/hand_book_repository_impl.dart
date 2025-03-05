import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/hand_book/datasources/hand_book_service.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/data/mappers/hand_book_main_categories_mapper.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/data/mappers/hand_book_categories_mapper.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/repositories/hand_book_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HandBookRepositoryImpl extends HandBookRepository {
  final HandBookService _handBookService;

  HandBookRepositoryImpl({required HandBookService handBookService}) : _handBookService = handBookService;

  @override
  Future<Either<Failure, List<HandBookMainCategoriesEntity>>> fetchHandBookMainCategoties() async {
    try {
      final response = await _handBookService.fetchHandBookMainCategoties();

      return right(
        HandBookMainCategoriesMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PreflightInspectionCategoriesEntity>>> fetchPreflightInspectionCategories() async {
    try {
      final response = await _handBookService.fetchPreflightInspectionCategories();

      return right(
        PreflightInspectionCategoriesMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  // @override
  // Future<Either<Failure, VideoForStudentsEntity>> fetchVideoById(int id) async {
  //   try {
  //     final response = await _videoForStudentsService.fetchVideoById(id);

  //     return right(
  //       VideoForStudentsMapper.toEntity(response),
  //     );
  //   } on DioException catch (e) {
  //     return left(
  //       ServerFailure(
  //         statusCode: e.response?.statusCode.toString(),
  //         message: e.message,
  //       ),
  //     );
  //   }
  // }
}

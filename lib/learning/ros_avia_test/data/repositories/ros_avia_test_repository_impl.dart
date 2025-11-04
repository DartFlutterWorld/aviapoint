import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/ros_avia_test/data/datasources/ros_avia_test_service.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/privat_pilot_plane_category_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/question_with_answers_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/ros_avia_test_category_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/ros_avia_test_category_with_questions_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/type_correct_answer_mapper.dart';
import 'package:aviapoint/learning/ros_avia_test/data/mappers/type_sertificates_mapper.dart';
import 'package:aviapoint/core/utils/talker_config.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/privat_pilot_plane_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_correct_answer_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RosAviaTestRepositoryImpl extends RosAviaTestRepository {
  final RosAviaTestService _rosAviaTestService;

  RosAviaTestRepositoryImpl({required RosAviaTestService rosAviaTestService}) : _rosAviaTestService = rosAviaTestService;

  @override
  Future<Either<Failure, List<TypeSertificatesEntity>>> fetchTypeCertificates() async {
    try {
      final response = await _rosAviaTestService.fetchTypeSertificates();

      return right(TypeSertificatesMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TypeCorrectAnswerEntity>>> fetchTypeCorrectAnswer() async {
    try {
      final response = await _rosAviaTestService.fetchTypeCorrectAnswer();

      return right(TypeCorrectAnswerMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<PrivatPilotPlaneCategoryEntity>>> fetchPrivatPilotPlaneCategory() async {
    try {
      final response = await _rosAviaTestService.fetchPrivatPilotPlaneCategory();

      return right(PrivatPilotPlaneCategoryMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  // // Получение чек листа  Предполётной проверки по конкретной категории.
  //   @override
  //   Future<Either<Failure, List<PreflightInspectionCheckListEntity>>> fetchPreflightInspectionCheckListByCategory(String preflihgtInspectionCategoryId) async {
  //     try {
  //       final response = await _rosAviaTestService.fetchPreflightInspectionCheckListByCategory(preflihgtInspectionCategoryId);

  //       return right(
  //         PreflightInspectionCheckListMapper.toEntities(response),
  //       );
  //     } on DioException catch (e) {
  //       return left(
  //         ServerFailure(
  //           statusCode: e.response?.statusCode.toString(),
  //           message: e.message,
  //         ),
  //       );
  //     }
  //   }

  //   // Получение всех чек листов из Предполётной проверки.
  //   @override
  //   Future<Either<Failure, List<PreflightInspectionCheckListEntity>>> fetchPreflightInspectionCheckList() async {
  //     try {
  //       final response = await _rosAviaTestService.fetchPreflightInspectionCheckList();

  //       return right(
  //         PreflightInspectionCheckListMapper.toEntities(response),
  //       );
  //     } on DioException catch (e) {
  //       return left(
  //         ServerFailure(
  //           statusCode: e.response?.statusCode.toString(),
  //           message: e.message,
  //         ),
  //       );
  //     }
  //   }

  //   @override
  //   Future<Either<Failure, List<NormalCategoriesEntity>>> fetchNormalCategories() async {
  //     try {
  //       final response = await _rosAviaTestService.fetchNormalCategories();

  //       return right(
  //         NormalCategoriesMapper.toEntities(response),
  //       );
  //     } on DioException catch (e) {
  //       return left(
  //         ServerFailure(
  //           statusCode: e.response?.statusCode.toString(),
  //           message: e.message,
  //         ),
  //       );
  //     }
  //   }

  // Получение чек листа  Нормальной проверки по конкретной категории.
  @override
  Future<Either<Failure, List<RosAviaTestCategoryWithQuestionsEntity>>> fetchRosAviaTestCategoryWithQuestions(int typeSsertificatesId) async {
    try {
      final response = await _rosAviaTestService.fetchRosAviaTestCategoryWithQuestions(typeSsertificatesId.toString());

      return right(RosAviaTestCategoryWithQuestionsMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<RosAviaTestCategoryEntity>>> fetchRosAviaTestCategory(int typeSsertificatesId) async {
    try {
      final response = await _rosAviaTestService.fetchRosAviaTestCategory(typeSsertificatesId.toString());

      return right(RosAviaTestCategoryMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<QuestionWithAnswersEntity>>> fetchQuestionsWithAnswersByCategoryAndTypeCertificate({
    required int typeSsertificatesId,
    required Set<int> categoryIds,
    required bool mixAnswers,
    required bool mixQuestions,
  }) async {
    try {
      final categoryIdsList = categoryIds.toList();
      final categoryIdsString = categoryIdsList.join(',');
      AppTalker.info('Fetching questions: typeSsertificatesId=$typeSsertificatesId, categoryIds=$categoryIdsString, mixAnswers=$mixAnswers, mixQuestions=$mixQuestions');

      final response = await _rosAviaTestService.fetchQuestionsWithAnswersByCategoryAndTypeCertificate(typeSsertificatesId.toString(), categoryIdsString, mixAnswers, mixQuestions);

      AppTalker.good('Received ${response.length} questions');

      // Маппируем через стандартный маппер
      var entities = QuestionWithAnswersMapper.toEntities(response);

      return right(entities);
    } on DioException catch (e) {
      AppTalker.error('DioException fetching questions', e, StackTrace.current);
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  //   // Получение всех чек листов из Нормальной процедуры.
  //   @override
  //   Future<Either<Failure, List<NormalCheckListEntity>>> fetchNormalCheckList() async {
  //     try {
  //       final response = await _rosAviaTestService.fetchNormalCheckList();

  //       return right(
  //         NormalCheckListMapper.toEntities(response),
  //       );
  //     } on DioException catch (e) {
  //       return left(
  //         ServerFailure(
  //           statusCode: e.response?.statusCode.toString(),
  //           message: e.message,
  //         ),
  //       );
  //     }
  //   }

  //   @override
  //   Future<Either<Failure, List<EmergencyCategoriesEntity>>> fetchEmergencyCategories() async {
  //     try {
  //       final response = await _rosAviaTestService.fetchEmergencyCategories();

  //       return right(
  //         EmergencyCategoriesMapper.toEntities(response),
  //       );
  //     } on DioException catch (e) {
  //       return left(
  //         ServerFailure(
  //           statusCode: e.response?.statusCode.toString(),
  //           message: e.message,
  //         ),
  //       );
  //     }
  //   }

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

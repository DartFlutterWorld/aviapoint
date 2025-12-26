import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/privat_pilot_plane_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_correct_answer_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';

import 'package:dartz/dartz.dart';

abstract class RosAviaTestRepository {
  /// Получение всех видов свидетельств.
  Future<Either<Failure, List<TypeSertificatesEntity>>> fetchTypeCertificates();
  Future<Either<Failure, List<TypeCorrectAnswerEntity>>> fetchTypeCorrectAnswer();
  Future<Either<Failure, List<PrivatPilotPlaneCategoryEntity>>> fetchPrivatPilotPlaneCategory();
  Future<Either<Failure, List<RosAviaTestCategoryWithQuestionsEntity>>> fetchRosAviaTestCategoryWithQuestions(
    int typeSsertificatesId,
  );
  Future<Either<Failure, List<RosAviaTestCategoryEntity>>> fetchRosAviaTestCategory(int typeSsertificatesId);
  Future<Either<Failure, List<QuestionWithAnswersEntity>>> fetchQuestionsWithAnswersByCategoryAndTypeCertificate({
    required int typeSsertificatesId,
    required Set<int> categoryIds,
    required bool mixAnswers,
    required bool mixQuestions,
  });
}

// List<QuestionWithAnswersModel>

import 'package:aviapoint/learning/ros_avia_test/data/models/privat_pilot_plane_category_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/ros_avia_test_category_with_questions_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/type_correct_answer_dto.dart';
import 'package:aviapoint/learning/ros_avia_test/data/models/type_sertificates_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ros_avia_test_service.g.dart';

@RestApi()
abstract class RosAviaTestService {
  factory RosAviaTestService(Dio dio) = _RosAviaTestService;

  @GET('/learning/ros_avia_test/type_sertificates')
  Future<List<TypeSertificatesDto>> fetchTypeSertificates();

  //Получение всех типов корректности ответа
  @GET('/learning/ros_avia_test/type_correct_answers')
  Future<List<TypeCorrectAnswerDto>> fetchTypeCorrectAnswer();

  // Получение категорий для Педполётных процедур
  @GET('/learning/ros_avia_test/privat_pilot_plane_category')
  Future<List<PrivatPilotPlaneCategoryDto>> fetchPrivatPilotPlaneCategory();

  // @GET('/learning/hand_book/preflight_inspection_categories/check_list/{preflihgtInspectionCategoryId}')
  // Future<List<PreflightInspectionCheckListDto>> fetchPreflightInspectionCheckListByCategory(@Path('preflihgtInspectionCategoryId') String preflihgtInspectionCategoryId);

  // @GET('/learning/hand_book/preflight_inspection_categories/check_list')
  // Future<List<PreflightInspectionCheckListDto>> fetchPreflightInspectionCheckList();

  // // Получение категорий для Нормальных процедур
  // @GET('/learning/hand_book/normal_categories')
  // Future<List<NormalCategoriesDto>> fetchNormalCategories();

  @GET('/learning/ros_avia_test/{typeCertificateId}')
  Future<List<RosAviaTestCategoryWithQuestionsDto>> fetchRosAviaTestCategoryWithQuestions(@Path('typeCertificateId') String typeCertificateId);

  @GET('/learning/ros_avia_test/categories/{typeCertificateId}')
  Future<List<RosAviaTestCategoryDto>> fetchRosAviaTestCategory(@Path('typeCertificateId') String typeCertificateId);

  // Получение всех вопросов по выбранному сертификату и темам
  @GET('/learning/ros_avia_test/questions/{typeCertificateId}')
  Future<List<QuestionWithAnswersDto>> fetchQuestionsWithAnswersByCategoryAndTypeCertificate(
    @Path('typeCertificateId') String typeCertificateId,
    @Query('categoryIds') String categoryIds,
    @Query('mixAnswers') bool mixAnswers,
  );

  // @GET('/learning/hand_book/normal_categories/check_list')
  // Future<List<NormalCheckListDto>> fetchNormalCheckList();

  // // Получение категорий для аварийных процедур
  // @GET('/learning/hand_book/emergency_categories')
  // Future<List<EmergencyCategoriesDto>> fetchEmergencyCategories();
}

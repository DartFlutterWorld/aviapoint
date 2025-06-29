import 'package:aviapoint/learning/hand_book/emegrency_categories_page/data/models/emergency_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/data/models/hand_book_main_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/data/models/normal_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/data/models/normal_check_list_dto.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/data/models/preflight_inspection_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/data/models/preflight_inspection_check_list_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'hand_book_service.g.dart';

@RestApi()
abstract class HandBookService {
  factory HandBookService(Dio dio) = _HandBookService;

  @GET('/learning/hand_book/main_categories')
  Future<List<HandBookMainCategoriesDto>> fetchHandBookMainCategoties();
  // Получение категорий для Педполётных процедур
  @GET('/learning/hand_book/preflight_inspection_categories')
  Future<List<PreflightInspectionCategoriesDto>> fetchPreflightInspectionCategories();

  @GET('/learning/hand_book/preflight_inspection_categories/check_list/{preflihgtInspectionCategoryId}')
  Future<List<PreflightInspectionCheckListDto>> fetchPreflightInspectionCheckListByCategory(@Path('preflihgtInspectionCategoryId') String preflihgtInspectionCategoryId);

  @GET('/learning/hand_book/preflight_inspection_categories/check_list')
  Future<List<PreflightInspectionCheckListDto>> fetchPreflightInspectionCheckList();

  // Получение категорий для Нормальных процедур
  @GET('/learning/hand_book/normal_categories')
  Future<List<NormalCategoriesDto>> fetchNormalCategories();

  @GET('/learning/hand_book/normal_categories/check_list/{normalCategoryId}')
  Future<List<NormalCheckListDto>> fetchNormalCheckListByCategory(@Path('normalCategoryId') String preflihgtInspectionCategoryId);

  @GET('/learning/hand_book/normal_categories/check_list')
  Future<List<NormalCheckListDto>> fetchNormalCheckList();

  // Получение категорий для аварийных процедур
  @GET('/learning/hand_book/emergency_categories')
  Future<List<EmergencyCategoriesDto>> fetchEmergencyCategories();
}

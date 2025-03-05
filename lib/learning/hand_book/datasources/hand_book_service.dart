import 'package:aviapoint/learning/hand_book/main_categories_page/data/models/hand_book_main_categories_dto.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/data/models/preflight_inspection_categories_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'hand_book_service.g.dart';

@RestApi()
abstract class HandBookService {
  factory HandBookService(Dio dio) = _HandBookService;

  @GET('/learning/hand_book/main_categories')
  Future<List<HandBookMainCategoriesDto>> fetchHandBookMainCategoties();

  @GET('/learning/hand_book/preflight_inspection_categories')
  Future<List<PreflightInspectionCategoriesDto>> fetchPreflightInspectionCategories();

  // @GET('/learning/check_list/{id}')
  // Future<HandBookDto> fetchCheckById(@Path('id') String id);
}

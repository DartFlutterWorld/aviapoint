import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/domain/entities/normal_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';

import 'package:dartz/dartz.dart';

abstract class HandBookRepository {
  /// Получение видеозаписей для студентов.
  Future<Either<Failure, List<HandBookMainCategoriesEntity>>> fetchHandBookMainCategoties();
  Future<Either<Failure, List<PreflightInspectionCategoriesEntity>>> fetchPreflightInspectionCategories();
  Future<Either<Failure, List<PreflightInspectionCheckListEntity>>> fetchPreflightInspectionCheckList();
  Future<Either<Failure, List<PreflightInspectionCheckListEntity>>> fetchPreflightInspectionCheckListByCategory(String preflihgtInspectionCategoryId);
  // Future<Either<Failure, VideoForStudentsEntity>> fetchVideoById(String id);

  Future<Either<Failure, List<NormalCategoriesEntity>>> fetchNormalCategories();
  Future<Either<Failure, List<NormalCheckListEntity>>> fetchNormalCheckList();
  Future<Either<Failure, List<NormalCheckListEntity>>> fetchNormalCheckListByCategory(String normalCategoryId);

  Future<Either<Failure, List<EmergencyCategoriesEntity>>> fetchEmergencyCategories();
}

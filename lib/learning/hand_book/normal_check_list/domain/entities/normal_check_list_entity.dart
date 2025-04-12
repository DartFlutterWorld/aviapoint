import 'package:equatable/equatable.dart';

class NormalCheckListEntity extends Equatable {
  final int id;
  final int normalCategoryId;
  final String title;
  final String doing;
  final String? picture;
  final String titleEng;
  final String doingEng;
  final bool checkList;
  final String? subCategory;
  final String? subCategoryEng;

  const NormalCheckListEntity({
    required this.id,
    required this.normalCategoryId,
    required this.title,
    required this.doing,
    required this.picture,
    required this.titleEng,
    required this.doingEng,
    required this.checkList,
    this.subCategory,
    this.subCategoryEng,
  });

  @override
  List<Object?> get props => [
        id,
        normalCategoryId,
        title,
        doing,
        picture,
        titleEng,
        doingEng,
        checkList,
      ];
}

import 'package:equatable/equatable.dart';

class EmergencyCategoriesEntity extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final String subTitleEng;
  final int mainCategoryId;
  final String titleEng;
  final String picture;

  const EmergencyCategoriesEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.subTitleEng,
    required this.mainCategoryId,
    required this.titleEng,
    required this.picture,
  });

  @override
  List<Object?> get props => [id, title, subTitle, mainCategoryId, titleEng, picture, subTitleEng];
}

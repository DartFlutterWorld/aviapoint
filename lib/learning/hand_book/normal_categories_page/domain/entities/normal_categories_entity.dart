import 'package:equatable/equatable.dart';

class NormalCategoriesEntity extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final int mainCategoryId;
  final String titleEng;
  final String picture;

  const NormalCategoriesEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.mainCategoryId,
    required this.titleEng,
    required this.picture,
  });

  @override
  List<Object?> get props => [id, title, subTitle, mainCategoryId, titleEng, picture];
}

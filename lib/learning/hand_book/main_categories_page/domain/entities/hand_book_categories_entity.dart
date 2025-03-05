import 'package:equatable/equatable.dart';

class HandBookMainCategoriesEntity extends Equatable {
  final int mainCategoryId;
  final String title;
  final String subTitle;
  final String picture;

  const HandBookMainCategoriesEntity({
    required this.mainCategoryId,
    required this.title,
    required this.subTitle,
    required this.picture,
  });

  @override
  List<Object?> get props => [mainCategoryId, title, subTitle, picture];
}

import 'package:equatable/equatable.dart';

class PreflightInspectionCheckListEntity extends Equatable {
  final int id;
  final int preflightInspectionCategoryId;
  final String title;
  final String doing;
  final String? picture;
  final String titleEng;
  final String doingEng;

  const PreflightInspectionCheckListEntity({
    required this.id,
    required this.preflightInspectionCategoryId,
    required this.title,
    required this.doing,
    required this.picture,
    required this.titleEng,
    required this.doingEng,
  });

  @override
  List<Object?> get props => [id, preflightInspectionCategoryId, title, doing, picture, titleEng, doingEng];
}

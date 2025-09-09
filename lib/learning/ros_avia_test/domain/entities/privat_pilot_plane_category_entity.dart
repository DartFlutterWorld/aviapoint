import 'package:equatable/equatable.dart';

class PrivatPilotPlaneCategoryEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final int typeCertificatesId;

  const PrivatPilotPlaneCategoryEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.typeCertificatesId,
  });
  @override
  List<Object?> get props => [id, title, image, typeCertificatesId];
}

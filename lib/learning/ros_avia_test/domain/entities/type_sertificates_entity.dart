import 'package:equatable/equatable.dart';

class TypeSertificatesEntity extends Equatable {
  final int id;
  final String title;
  final String image;

  const TypeSertificatesEntity({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];
}

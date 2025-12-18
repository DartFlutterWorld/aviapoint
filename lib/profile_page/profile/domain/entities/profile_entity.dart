import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String phone;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;

  const ProfileEntity({required this.id, required this.phone, this.email, this.firstName, this.lastName, this.avatarUrl});

  @override
  List<Object?> get props => [id, phone, email, firstName, lastName, avatarUrl];
}

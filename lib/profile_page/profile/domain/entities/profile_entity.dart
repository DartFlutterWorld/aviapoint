import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String phone;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;
  final String? telegram;
  final String? max;
  final double? averageRating;
  final int? reviewsCount;
  final List<int>? ownedAirports; // Список ID аэропортов, которыми владеет пользователь

  const ProfileEntity({
    required this.id,
    required this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.telegram,
    this.max,
    this.averageRating,
    this.reviewsCount,
    this.ownedAirports,
  });

  @override
  List<Object?> get props => [id, phone, email, firstName, lastName, avatarUrl, telegram, max, averageRating, reviewsCount, ownedAirports];
}

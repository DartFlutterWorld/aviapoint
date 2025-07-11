import 'package:aviapoint/auth_page/domain/entities/auth_entity.dart';
import 'package:aviapoint/auth_page/domain/entities/sms_entity.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// Интерфейс для репозитория авторизации.
abstract class AuthRepository {
  Future<Either<Failure, SmsEntity>> getSms(String phone);
  Future<Either<Failure, AuthEntity>> auth({required String phone, required String sms});
  Future<String?> refreshToken(String? refreshToken);
}

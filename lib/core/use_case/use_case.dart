import 'package:dartz/dartz.dart';
import 'package:aviapoint/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

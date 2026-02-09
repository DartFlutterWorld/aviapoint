import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/domain/entities/company_short_info.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoRepository {
  Future<Either<Failure, CompanyShortInfo>> getCompanyByInn(String inn);
}

import 'package:dartz/dartz.dart';
import '../../../../../../shared/helpers/errors.dart';
import '../../entities/enterprises_entity.dart';

abstract class IGetAllEnterprise {
  Future<Either<Failure, List<EnterpriseEntity>>> call();
}

import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../entities/enterprises_entity.dart';

abstract class IEnterpriseRepository {
  Future<Either<Failure, List<EnterpriseEntity>>> get();
}

import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ILogOut {
  Future<Either<Failure, bool>> call();
}

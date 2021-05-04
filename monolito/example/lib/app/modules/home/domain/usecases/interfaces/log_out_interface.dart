import 'package:dartz/dartz.dart';
import '../../../../../../shared/helpers/errors.dart';

abstract class ILogOut {
  Future<Either<Failure, bool>> call();
}

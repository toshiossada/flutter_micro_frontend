import 'package:dartz/dartz.dart';
import '../../../../../shared/helpers/errors.dart';

abstract class IAuthenticateRepository {
  Future<Either<Failure, bool>> logOut();
}

import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthenticateRepository {
  Future<Either<Failure, bool>> logOut();
}

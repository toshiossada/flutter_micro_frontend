import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IGetLoggedUser {
  Future<Either<Failure, AuthModel>> call();
}

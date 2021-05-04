import 'package:dartz/dartz.dart';
import '../../../../../../shared/auth/models/auth_model.dart';
import '../../../../../../shared/helpers/errors.dart';

abstract class IGetLoggedUser {
  Future<Either<Failure, AuthModel>> call();
}

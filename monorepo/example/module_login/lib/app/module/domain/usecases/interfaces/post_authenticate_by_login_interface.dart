import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../../entities/authenticate_entity.dart';

abstract class IPostAuthenticateByLogin {
  Future<Either<Failure, AuthModel>> call(AuthenticateEntity resquest);
}
 
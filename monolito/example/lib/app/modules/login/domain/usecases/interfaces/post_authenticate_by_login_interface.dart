import 'package:dartz/dartz.dart';
import '../../../../../../shared/auth/models/auth_model.dart';
import '../../../../../../shared/helpers/errors.dart';

import '../../entities/authenticate_entity.dart';

abstract class IPostAuthenticateByLogin {
  Future<Either<Failure, AuthModel>> call(AuthenticateEntity resquest);
}

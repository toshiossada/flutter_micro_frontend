import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../entities/authenticate_entity.dart';
import '../errors/errors.dart';
import '../repositories/authenticate_repository_interface.dart';
import 'interfaces/post_authenticate_by_login_interface.dart';

class PostAuthenticateByLogin implements IPostAuthenticateByLogin {
  final IAuthenticateRepository _authenticateRepository;

  PostAuthenticateByLogin(this._authenticateRepository);
  @override
  Future<Either<Failure, AuthModel>> call(AuthenticateEntity resquest) async {
    if (!resquest.isValid) {
      return Left(FailurePostAuthenticate(
          message: 'Login ou senha esta com preenchimento inválido'));
    }

    try {
      return _authenticateRepository.authenticate(resquest);
    } on Exception {
      throw FailurePostAuthenticate(message: 'Erro ao realizar login');
    }
  }
}

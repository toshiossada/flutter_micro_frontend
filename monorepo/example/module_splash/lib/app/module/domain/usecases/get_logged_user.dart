import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../repositories/auth_repository_interface.dart';
import 'interfaces/get_logged_user_interface.dart';

class GetLoggedUser implements IGetLoggedUser {
  final IAuthenticateRepository _authenticateRepository;

  GetLoggedUser(this._authenticateRepository);

  @override
  Future<Either<Failure, AuthModel>> call() async {
    try {
      return _authenticateRepository.get();
    } on Exception {
      return Left(
          GetLoggedUserFailure(message: 'Erro ao buscar usuario logado'));
    }
  }
}

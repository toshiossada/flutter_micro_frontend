import 'package:dartz/dartz.dart';

import '../../../../../shared/auth/models/auth_model.dart';
import '../../../../../shared/helpers/errors.dart';
import '../errors/errors.dart';
import '../repositories/auth_repository_interface.dart';
import 'interfaces/get_logged_user_repository.dart';

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

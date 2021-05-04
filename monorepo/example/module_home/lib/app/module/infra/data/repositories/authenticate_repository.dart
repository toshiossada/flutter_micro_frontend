import 'package:commons/shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/repositories/authenticate_repository_interface.dart';

class AuthenticateRepository implements IAuthenticateRepository {
  final IAuthLocalStorage _localStorage;

  AuthenticateRepository(this._localStorage);

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      _localStorage.clear();

      return Right(true);
    } on Failure catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(RepositoryFailure(message: error.toString()));
    }
  }
}

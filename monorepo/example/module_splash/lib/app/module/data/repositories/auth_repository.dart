import 'package:commons/shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import 'package:commons/shared/auth/models/auth_model.dart';
import 'package:commons/shared/helpers/errors.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/auth_repository_interface.dart';

class AuthenticateRepository implements IAuthenticateRepository {
  final IAuthLocalStorage _localStorage;

  AuthenticateRepository(this._localStorage);

  @override
  Future<Either<Failure, AuthModel>> get() async {
    try {
      final result = await _localStorage.getAll();
      if (result.isNotEmpty) {
        return Right(result.first);
      } else {
        return Left(UserNotFound(message: 'Usuario não esta logado'));
      }
    } on Failure catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(UserNotFound(message: error.toString()));
    }
  }
}

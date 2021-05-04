import 'package:dartz/dartz.dart';

import '../../../../../shared/helpers/errors.dart';
import '../repositories/authenticate_repository_interface.dart';
import 'interfaces/log_out_interface.dart';

class LogOut implements ILogOut {
  final IAuthenticateRepository _enterpriseRepository;

  LogOut(this._enterpriseRepository);
  @override
  Future<Either<Failure, bool>> call() async {
    var result = await _enterpriseRepository.logOut();

    return result;
  }
}

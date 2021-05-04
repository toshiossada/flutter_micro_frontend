import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../shared/auth/stores/auth_store.dart';
import '../../../domain/usecases/interfaces/get_logged_user_repository.dart';

class SplashController {
  final IGetLoggedUser _getLoggedUser;
  final AuthStore _authStore;
  SplashController(this._getLoggedUser, this._authStore);

  load() async {
    //Faz o carregamento necessarios das depedencias do app antes de iniciar
    var login = await _getLoggedUser();
    if (login.isRight()) {
      _authStore.setLogin(login);
      Future.delayed(Duration(seconds: 1)).then(
        (value) => Modular.to.navigate('/'),
      );
    } else {
      Future.delayed(Duration(seconds: 1)).then(
        (value) => Modular.to.navigate('/login'),
      );
    }
  }
}

import 'package:commons/shared/auth/stores/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/interfaces/get_all_enterprise_interface.dart';
import '../../../domain/usecases/interfaces/log_out_interface.dart';
import '../../stores/home_store.dart';

class HomeController {
  final IGetAllEnterprise _getAllEnterprise;
  final ILogOut _logOut;
  final HomeStore store;
  final AuthStore _authStore;

  HomeController(
    this._getAllEnterprise,
    this._logOut,
    this._authStore,
    this.store,
  ) {
    getEnterprises();
  }

  Future<void> getEnterprises() async {
    store.setEnterprises(_getAllEnterprise());
  }

  Future<void> logout() async {
    var result = await _logOut();

    if (result.isRight()) {
      _authStore.clear();
      Modular.to.navigate('/login');
    }
  }
}

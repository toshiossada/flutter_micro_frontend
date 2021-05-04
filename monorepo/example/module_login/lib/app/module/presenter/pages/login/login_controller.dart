import 'package:asuka/asuka.dart' as asuka;
import 'package:commons/shared/auth/stores/auth_store.dart';
import 'package:commons/shared/components/loading_progress_indicator/loading_progress_indicator_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/authenticate_entity.dart';
import '../../../domain/usecases/interfaces/post_authenticate_by_login_interface.dart';

class LoginController {
  final IPostAuthenticateByLogin _authenticateByLogin;
  final AuthStore store;

  LoginController(this._authenticateByLogin, this.store);

  void setError(String v) => store.setErrorMsg(v);
  void setEmail(String v) => store.setEmail(v);
  void setPassword(String v) => store.setPassword(v);

  Future<void> login(String login, String password, String? errorMsg) async {
    var overlay = OverlayEntry(
      builder: (context) {
        return LoadingProgressIndicatorWidget(
          isCustom: true,
        );
      },
    );
    asuka.addOverlay(overlay);
    await Future.delayed(Duration(seconds: 2));
    var requestAuthenticate =
        AuthenticateEntity(login: login, password: password);

    var request = requestAuthenticate;
    var result = await _authenticateByLogin(request);

    await store.setLogin(result);
    print(store.state);
    overlay.remove();
    if (result is Right) {
      Modular.to.navigate('/');
    }
  }
}

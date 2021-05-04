import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../auth/models/auth_model.dart';
import '../../helpers/errors.dart';

class AuthStore extends NotifierStore<Failure, AuthModel> {
  AuthStore() : super(AuthModel());
  void setErrorMsg(String? v) => update(state.copyWith(messageError: v));
  void setEmail(String v) {
    var newState = state.copyWith(email: v);
    update(newState);
  }

  void setPassword(String v) {
    var newState = state.copyWith(password: v);
    update(newState);
  }

  Future<void> setLogin(Either<Failure, AuthModel> value) async {
    await executeEither(() async => value, delay: Duration(milliseconds: 500));
  }

  Future<void> clear() async {
    update(AuthModel());
  }
}

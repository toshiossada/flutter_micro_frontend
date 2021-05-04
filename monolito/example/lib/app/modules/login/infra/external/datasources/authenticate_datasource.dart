import 'package:dio/native_imp.dart';

import '../../../../../../shared/auth/models/auth_model.dart';
import '../../../../../../shared/helpers/errors.dart';
import '../../data/datasources/authenticate_datasource_interface.dart';
import '../../models/authenticate_model.dart';

class AuthenticateDatasource implements IAuthenticateDatasource {
  final DioForNative _client;

  AuthenticateDatasource(this._client);

  Future<AuthModel> authenticate(AuthenticateModel auth) async {
    final response = await _client.post("/users/auth/sign_in",
        queryParameters: {"email": auth.login, "password": auth.password});

    if (response.statusCode == 200 && response.data['success']) {
      var model = AuthModel.fromHeader(response.headers);
      model = model.copyWith(
        email: auth.login,
        password: auth.password,
      );
      return model;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}

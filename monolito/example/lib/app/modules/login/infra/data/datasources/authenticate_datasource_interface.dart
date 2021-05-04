import '../../../../../../shared/auth/models/auth_model.dart';

import '../../models/authenticate_model.dart';

abstract class IAuthenticateDatasource {
  Future<AuthModel> authenticate(AuthenticateModel auth);
}

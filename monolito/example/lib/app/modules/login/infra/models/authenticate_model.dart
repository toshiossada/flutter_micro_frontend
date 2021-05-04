import '../../domain/entities/authenticate_entity.dart';

class AuthenticateModel extends AuthenticateEntity {
  AuthenticateModel({
    required String login,
    required String password,
  }) : super(login: login, password: password);
}

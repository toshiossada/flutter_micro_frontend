import 'package:flutter/foundation.dart';

@immutable
class AuthenticateEntity {
  final String login;
  final String password;

  AuthenticateEntity({
    required this.login,
    required this.password,
  });

  bool get isValid => login.isNotEmpty && password.isNotEmpty;
}

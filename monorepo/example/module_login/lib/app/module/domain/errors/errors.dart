import 'package:commons/shared/helpers/errors.dart';

abstract class FailureLogin implements Failure {}

class FailurePostAuthenticate implements FailureLogin {
  @override
  final String? message;
  FailurePostAuthenticate({
    this.message,
  });
}

class AuthenticateRepostoryError implements FailureLogin {
  @override
  final String? message;
  AuthenticateRepostoryError({
    this.message,
  });
}

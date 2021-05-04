import 'package:commons/shared/helpers/errors.dart';

abstract class FailureSplash implements Failure {}

class GetLoggedUserFailure implements FailureSplash {
  @override
  final String? message;
  GetLoggedUserFailure({
    this.message,
  });
}

class UserNotFound implements FailureSplash {
  @override
  final String? message;
  UserNotFound({
    this.message,
  });
}

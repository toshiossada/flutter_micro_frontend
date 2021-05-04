import '../../../../../shared/helpers/errors.dart';

abstract class HomeFailure implements Failure {}

class FailureGetEnterprises implements HomeFailure {
  @override
  final String? message;
  FailureGetEnterprises({
    this.message,
  });
}

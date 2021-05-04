import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../helpers/errors.dart';

@Injectable()
class PasswordTextFormFieldStore extends NotifierStore<Failure, bool> {
  PasswordTextFormFieldStore() : super(false);
  void setPasswordVisibility({bool v = false}) => update(v);
  void switchVisible() => update(!state);
}

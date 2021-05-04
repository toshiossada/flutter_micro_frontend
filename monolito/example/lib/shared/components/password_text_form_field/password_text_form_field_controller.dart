import 'package:flutter_modular/flutter_modular.dart';

import 'stores/password_text_form_field_store.dart';

@Injectable()
class PasswordTextFormFieldController {
  final PasswordTextFormFieldStore store;
  PasswordTextFormFieldController(
    this.store,
  );

  void switchVisible() => store.switchVisible();
}

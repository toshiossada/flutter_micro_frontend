import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/auth/local_storage/auth_local_storage.dart';
import '../shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import '../shared/auth/stores/auth_store.dart';
import '../shared/components/password_text_form_field/password_text_form_field_controller.dart';
import '../shared/components/password_text_form_field/stores/password_text_form_field_store.dart';
import '../shared/helpers/consts.dart' as config;
import '../shared/helpers/custom_dio/custom_dio.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton<IAuthLocalStorage>((i) => AuthLocalStorage()),
    Bind.factory((i) => PasswordTextFormFieldStore()),
    Bind.factory((i) => PasswordTextFormFieldController(i())),
    Bind.lazySingleton((i) => CustomDio(i(), i(), i())),
    Bind.lazySingleton((i) => BaseOptions(
          baseUrl: config.baseUrlLogin,
          connectTimeout: 5000,
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/splash', module: SplashModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}

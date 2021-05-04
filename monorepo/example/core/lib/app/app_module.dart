import 'package:dio/dio.dart';
import 'package:commons/shared/auth/local_storage/auth_local_storage.dart';
import 'package:commons/shared/auth/local_storage/interfaces/auth_repository_interface.dart';
import 'package:commons/shared/auth/stores/auth_store.dart';
import 'package:commons/shared/components/password_text_form_field/password_text_form_field_controller.dart';
import 'package:commons/shared/components/password_text_form_field/stores/password_text_form_field_store.dart';
import 'package:commons/shared/helpers/custom_dio/custom_dio.dart';
import 'package:commons/shared/helpers/consts.dart' as config;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_home/app/home_module.dart';
import 'package:module_login/app/login_module.dart';
import 'package:module_splash/app/splash_module.dart';


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

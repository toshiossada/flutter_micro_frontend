import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/auth_repository.dart';
import 'domain/repositories/auth_repository_interface.dart';
import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/interfaces/get_logged_user_repository.dart';
import 'presenter/pages/splash/splash_controller.dart';
import 'presenter/pages/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController(i(), i())),
    Bind.lazySingleton<IGetLoggedUser>((i) => GetLoggedUser(i())),
    Bind.lazySingleton<IAuthenticateRepository>(
        (i) => AuthenticateRepository(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}

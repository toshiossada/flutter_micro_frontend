import 'package:flutter_modular/flutter_modular.dart';

import 'module/data/repositories/auth_repository.dart';
import 'module/domain/repositories/auth_repository_interface.dart';
import 'module/domain/usecases/get_logged_user.dart';
import 'module/domain/usecases/interfaces/get_logged_user_interface.dart';
import 'module/presenter/pages/splash/splash_controller.dart';
import 'module/presenter/pages/splash/splash_page.dart';

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

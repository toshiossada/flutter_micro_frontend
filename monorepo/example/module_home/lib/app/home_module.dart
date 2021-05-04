import 'package:flutter_modular/flutter_modular.dart';

import 'module/domain/repositories/authenticate_repository_interface.dart';
import 'module/domain/usecases/get_all_enterprise.dart';
import 'module/domain/usecases/interfaces/log_out_interface.dart';
import 'module/domain/usecases/log_out.dart';
import 'module/infra/data/repositories/authenticate_repository.dart';
import 'module/infra/data/repositories/enterprise_repository.dart';
import 'module/infra/external/datasources/enterprise_datasource.dart';
import 'module/presenter/pages/details/details_controller.dart';
import 'module/presenter/pages/details/details_page.dart';
import 'module/presenter/pages/details/details_store.dart';
import 'module/presenter/pages/home/home_controller.dart';
import 'module/presenter/pages/home/home_page.dart';
import 'module/presenter/stores/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DetailsController(
          i(),
          i(),
          enterprise: i.args!.data,
        )),
    Bind.lazySingleton((i) => HomeController(i(), i(), i(), i())),
    Bind.lazySingleton<ILogOut>((i) => LogOut(i())),
    Bind.lazySingleton<IAuthenticateRepository>(
        (i) => AuthenticateRepository(i())),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => DetailsStore()),
    Bind.lazySingleton((i) => EnterpriseDatasource(i())),
    Bind.lazySingleton((i) => EnterpriseRepository(i())),
    Bind.lazySingleton((i) => GetAllEnterprise(i())),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('enterprise/:id', child: (_, args) => DetailsPage()),
  ];
}

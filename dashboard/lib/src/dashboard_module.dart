import 'package:dashboard/src/inicio/inicio_controller.dart';
import 'package:dashboard/src/inicio/inicio_page.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:http/http.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.lazySingleton((i) => InicioController(HttpDioClient(i<Dio>()))),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/inicio/',
          child: (_, args) =>
              InicioPage(controller: Modular.get<InicioController>()),
        ),
      ];
}

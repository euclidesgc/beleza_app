import 'package:package_manager/package_manager.dart';

class DashboardController {
  goModule(int ind) {
    switch (ind) {
      case 0:
        Modular.to.pushNamed('/inicio/');
        break;
      case 1:
        Modular.to.pushNamed('/novidades/');
        break;
      case 2:
        Modular.to.pushNamed('/divulgar/');
        break;
      case 3:
        Modular.to.pushNamed('/pedidos/');
        break;
      case 4:
        Modular.to.pushNamed('/menu/');
        break;

      default:
    }
  }
}

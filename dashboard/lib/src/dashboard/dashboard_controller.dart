import 'package:package_manager/package_manager.dart';
import 'package:shared/shared.dart';

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

  /// Exemplo de como usar a NavigationService para recuperar o context atual e
  /// exibir um AlertDialog.
  exibeDialogo(String message) {
    AppAlertDialog.showAlertDialog(
        NavigationService.navigatorKey.currentContext!, message);
  }
}

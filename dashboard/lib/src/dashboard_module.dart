import 'dart:developer' as dev;

import 'package:dashboard/src/bottom_menu/bottom_menu_controller.dart';
import 'package:dashboard/src/bottom_menu/bottom_menu_page.dart';
import 'package:dashboard/src/dashboard/dashboard_controller.dart';
import 'package:dashboard/src/dashboard/dashboard_page.dart';
import 'package:design_system/design_system.dart';
import 'package:divulgar/divulgar.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:http/http.dart';
import 'package:novidades/novidades.dart';
import 'package:pedidos/pedidos.dart';
import 'package:shared/shared.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<EventBus>((i) {
          dev.log('🚌 EventBus initialized!');
          return EventBus(sync: true);
        }),
        Bind.singleton((i) => Dio()),
        Bind.lazySingleton((i) => DashboardController(HttpDioClient(i<Dio>()))),
        Bind.lazySingleton((i) => BottomMenuController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/modal',
            child: (_, args) => AppModal(message: args.data),
            transition: TransitionType.downToUp),
        ChildRoute(
          '/',
          child: (_, args) => BottomMenuPage(controller: Modular.get()),
          children: [
            ChildRoute(
              '/inicio',
              child: (_, args) => DashboardPage(controller: Modular.get()),
            ),
            ModuleRoute('/novidades', module: NovidadesModule()),
            ModuleRoute('/divulgar', module: DivulgarModule()),
            ModuleRoute('/pedidos', module: PedidosModule()),
          ],
        ),
      ];

  @override
  void dispose() {
    super.dispose();
    dev.log('📛 🚌 📛 ATENÇÃO: EventBus disposed! 📛 🚌 📛');
  }
}

import 'dart:developer' as dev;

import 'package:dashboard/src/bottom_menu/bottom_menu_controller.dart';
import 'package:dashboard/src/bottom_menu/bottom_menu_page.dart';
import 'package:dashboard/src/dashboard/dashboard_controller.dart';
import 'package:dashboard/src/dashboard/dashboard_page.dart';
import 'package:design_system/design_system.dart';
import 'package:disseminate/disseminate.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:news/news.dart';
import 'package:orders/orders.dart';
import 'package:shared/shared.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<EventBus>((i) {
          dev.log('🚌 EventBus initialized!');
          return EventBus(sync: true);
        }),
        Bind.lazySingleton((i) => BottomMenuController()),
        Bind.lazySingleton((i) => DashboardController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/modal',
          child: (_, args) => AppModal(message: args.data),
        ),
        ChildRoute(
          '/',
          child: (_, args) => BottomMenuPage(controller: Modular.get()),
          children: [
            ChildRoute(
              '/inicio',
              child: (_, args) => DashboardPage(controller: Modular.get()),
            ),
            ModuleRoute(
              '/news',
              module: NewsModule(),
            ),
            ModuleRoute(
              '/disseminate',
              module: DisseminateModule(),
            ),
            ModuleRoute(
              '/orders',
              module: OrdersModule(),
            ),
          ],
        ),
      ];

  @override
  void dispose() {
    super.dispose();
    dev.log('📛 🚌 📛 ATENÇÃO: EventBus disposed! 📛 🚌 📛');
  }
}

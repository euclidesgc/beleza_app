import 'package:orders/src/orders/orders_page.dart';
import 'package:package_manager/package_manager.dart';

class OrdersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const OrdersPage()),
      ];
}

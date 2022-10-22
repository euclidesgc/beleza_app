import 'package:external_dependencies/external_dependencies.dart';
import 'package:orders/src/orders/orders_page.dart';

class OrdersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const OrdersPage()),
      ];
}

import 'package:package_manager/package_manager.dart';

import 'cart/cart_page.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const CartPage()),
      ];
}

import 'package:external_dependencies/external_dependencies.dart';

import 'cart/cart_page.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const CartPage()),
      ];
}

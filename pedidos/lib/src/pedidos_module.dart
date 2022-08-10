import 'package:external_dependencies/external_dependencies.dart';

import 'pedidos/pedidos_page.dart';

class PedidosModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const PedidosPage()),
      ];
}

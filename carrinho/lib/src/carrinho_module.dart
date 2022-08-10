import 'package:external_dependencies/external_dependencies.dart';

import 'carrinho/carrinho_page.dart';

class CarrinhoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const CarrinhoPage()),
      ];
}

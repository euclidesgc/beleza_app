import 'package:external_dependencies/external_dependencies.dart';

import 'menu/menu_page.dart';

class MenuModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const MenuPage()),
      ];
}

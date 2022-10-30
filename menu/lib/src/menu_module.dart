import 'package:package_manager/package_manager.dart';

import 'menu/menu_page.dart';

class MenuModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const MenuPage()),
      ];
}

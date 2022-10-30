import 'package:package_manager/package_manager.dart';

import 'clube_boti/clube_boti_page.dart';

class ClubeBotiModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const ClubeBotiPage()),
      ];
}

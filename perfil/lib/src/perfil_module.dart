import 'package:external_dependencies/external_dependencies.dart';

import 'perfil/perfil_page.dart';

class PerfilModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const PerfilPage()),
      ];
}

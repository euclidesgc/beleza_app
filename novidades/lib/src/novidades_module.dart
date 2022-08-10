import 'package:external_dependencies/external_dependencies.dart';

import 'novidades/novidades_page.dart';

class NovidadesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const NovidadesPage()),
      ];
}

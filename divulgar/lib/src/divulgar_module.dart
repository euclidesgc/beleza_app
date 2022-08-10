import 'package:external_dependencies/external_dependencies.dart';

import 'divulgar/divulgar_page.dart';

class DivulgarModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const DivulgarPage()),
      ];
}

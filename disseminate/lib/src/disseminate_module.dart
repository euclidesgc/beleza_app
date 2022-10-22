import 'package:external_dependencies/external_dependencies.dart';

import 'disseminate/disseminate_page.dart';

class DisseminateModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const DisseminatePage()),
      ];
}

import 'package:package_manager/package_manager.dart';

import 'disseminate/disseminate_page.dart';

class DisseminateModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const DisseminatePage()),
      ];
}

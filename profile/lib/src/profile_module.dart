import 'package:external_dependencies/external_dependencies.dart';

import 'profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const ProfilePage()),
      ];
}

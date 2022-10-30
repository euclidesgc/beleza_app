import 'package:package_manager/package_manager.dart';
import 'package:splash/src/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
      ];
}

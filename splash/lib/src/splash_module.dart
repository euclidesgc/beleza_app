import 'package:external_dependencies/external_dependencies.dart';
import 'package:splash/src/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];
  

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
      ];
}

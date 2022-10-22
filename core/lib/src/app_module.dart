import 'package:cart/cart.dart';
import 'package:clube_boti/clube_boti.dart';
import 'package:dashboard/dashboard.dart';
import 'package:divulgar/divulgar.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:home/home.dart';
import 'package:menu/menu.dart';
import 'package:novidades/novidades.dart';
import 'package:pedidos/pedidos.dart';
import 'package:perfil/perfil.dart';
import 'package:splash/splash.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/dashboard', module: DashboardModule()),
        ModuleRoute('/cart', module: CartModule()),
        ModuleRoute('/clube_boti', module: ClubeBotiModule()),
        ModuleRoute('/divulgar', module: DivulgarModule()),
        ModuleRoute('/novidades', module: NovidadesModule()),
        ModuleRoute('/pedidos', module: PedidosModule()),
        ModuleRoute('/menu', module: MenuModule()),
        ModuleRoute('/perfil', module: PerfilModule()),
      ];
}

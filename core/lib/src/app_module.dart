import 'dart:developer';

import 'package:cart/cart.dart';
import 'package:clube_boti/clube_boti.dart';
import 'package:dashboard/dashboard.dart';
import 'package:disseminate/disseminate.dart';
import 'package:event_bus/event_bus.dart';
import 'package:home/home.dart';
import 'package:menu/menu.dart';
import 'package:news/news.dart';
import 'package:orders/orders.dart';
import 'package:package_manager/package_manager.dart';
import 'package:profile/profile.dart';
import 'package:splash/splash.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<EventBus>((i) {
          log('🚌 EventBus initialized!');
          return EventBus(sync: true);
        }),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/dashboard', module: DashboardModule()),
        ModuleRoute('/cart', module: CartModule()),
        ModuleRoute('/clube_boti', module: ClubeBotiModule()),
        ModuleRoute('/disseminate', module: DisseminateModule()),
        ModuleRoute('/news', module: NewsModule()),
        ModuleRoute('/orders', module: OrdersModule()),
        ModuleRoute('/menu', module: MenuModule()),
        ModuleRoute('/profile', module: ProfileModule()),
      ];

  @override
  void dispose() {
    super.dispose();
    log('📛 🚌 📛 ATENÇÃO: EventBus disposed! 📛 🚌 📛');
  }
}

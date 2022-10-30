import 'package:news/src/novidades/news_page.dart';
import 'package:package_manager/package_manager.dart';

class NewsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const NewsPage()),
      ];
}

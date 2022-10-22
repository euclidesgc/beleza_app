import 'package:external_dependencies/external_dependencies.dart';
import 'package:news/src/novidades/news_page.dart';

class NewsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const NewsPage()),
      ];
}

import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class InicioController {
  final HttpDioClient _client;

  InicioController(this._client) {
    // Modular.get<EventBus>().on().listen((event) {
    //   debugPrint('❤ ❤ ❤ ${event.toString()}');
    // });
  }

  goModule(int ind) {
    switch (ind) {
      case 0:
        Modular.to.pushNamed('/inicio/');
        break;
      case 1:
        Modular.to.pushNamed('/novidades/');
        break;
      case 2:
        Modular.to.pushNamed('/divulgar/');
        break;
      case 3:
        Modular.to.pushNamed('/pedidos/');
        break;
      case 4:
        Modular.to.pushNamed('/menu/');
        break;

      default:
    }
  }

  getCatFact() async {
    final response = await _client.request(
      url: 'https://cat-fact.herokuapp.com/facts',
      method: MethodHttp.GET,
    );

    debugPrint(response.body.toString());
  }
}

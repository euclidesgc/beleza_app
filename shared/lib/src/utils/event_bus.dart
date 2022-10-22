import 'dart:async';

import 'package:external_dependencies/external_dependencies.dart';

class EventBus implements Disposable {
  // Criando um EventBus no Flutter:

  // passo 01: Criamos um streamCopntroller privado
  final StreamController _streamController;

  // passo 02: um método get que devolve o streamController privado
  StreamController get streamController => _streamController;

  // passo 03: Um construtor que passa uma nova instancia de streamController do tipo broadcast
  // para o streamController privado
  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  //Opcional: Um construtor que recebe um controller personalizado
  EventBus.customController(StreamController controller)
      : _streamController = controller;

  // Neste método chamdo on, quando o tipo é passado a stream é filtrada por este tipo,
  // caso contrário, dynamic é assumido e a stream é retornada
  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void send(event) {
    streamController.add(event);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

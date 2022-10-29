import 'dart:async';

import 'package:external_dependencies/external_dependencies.dart';

class EventBus implements Disposable {
  final StreamController _streamController;

  StreamController get streamController => _streamController;

  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

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

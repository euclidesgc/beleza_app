import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class NovidadesPage extends StatelessWidget {
  const NovidadesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<EventBus>().on().listen((event) {
      debugPrint('❤ ❤ ❤ ${event.toString()}');
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novidades'),
      ),
      body: Container(),
    );
  }
}

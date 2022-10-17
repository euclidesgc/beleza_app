import 'package:flutter/material.dart';

class NovidadesPage extends StatelessWidget {
  const NovidadesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modular.get<EventBus>().on().listen((event) {
    //   debugPrint('❤ ❤ ❤ ${event.toString()}');
    // });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Novidades'),
      ),
      body: Container(),
    );
  }
}

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novidades'),
      ),
      body: Center(
        child: Column(
          children: [
            AppButton(
              label: 'Comprar 01',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: 1));
              },
            ),
            AppButton(
              label: 'Remover 01',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: -1));
              },
            ),
            AppButton(
              label: 'Show Modal!',
              onPressed: () {
                Modular.get<EventBus>()
                    .send(EventModal('Modal vindo do NOVIDADES!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

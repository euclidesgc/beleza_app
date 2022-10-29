import 'package:design_system/design_system.dart';
import 'package:event_bus/event_bus.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisseminatePage extends StatelessWidget {
  const DisseminatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppButton(
              label: 'Divulgar Button - Incrementar valor',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: 1));
              },
            ),
            AppButton(
              label: 'Divulgar Button - Decrementar valor',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: -1));
              },
            ),
            AppButton(
              label: 'Divulgar Button - Show Modal!',
              onPressed: () {
                Modular.get<EventBus>()
                    .send(EventModal('Modal vindo do DIVULGAR!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
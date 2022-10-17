import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class NovidadesPage extends StatelessWidget {
  const NovidadesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modular.get<EventBus>().on().listen((event) {
    //   debugPrint('❤ ❤ ❤ ${event.toString()}');
    // });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppButton(
              label: 'Novidades Button - Incrementar valor',
              onPressed: () {
                Modular.get<EventBus>().fire(EventCount(value: 1));
              },
            ),
            AppButton(
              label: 'Novidades Button - Decrementar valor',
              onPressed: () {
                Modular.get<EventBus>().fire(EventCount(value: -1));
              },
            ),
            AppButton(
              label: 'Novidades Button - Show Modal!',
              onPressed: () {
                Modular.get<EventBus>()
                    .fire(EventModal('Modal vindo do NOVIDADES!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

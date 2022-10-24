import 'package:dashboard/src/dashboard/dashboard_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DashboardPage extends StatefulWidget {
  final DashboardController controller;

  const DashboardPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              label: 'Comprar 1',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: 1));
              },
            ),
            AppButton(
              label: 'Remover 1',
              onPressed: () {
                Modular.get<EventBus>().send(EventCount(value: -1));
              },
            ),
            AppButton(
              label: 'Show Modal!',
              onPressed: () {
                Modular.get<EventBus>().send(
                  EventModal('Modal vindo do DASHBOARD!'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

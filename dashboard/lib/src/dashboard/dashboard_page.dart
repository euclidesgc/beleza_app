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
              label: 'Dashboard Button - Incrementar valor',
              onPressed: () {
                Modular.get<EventBus>().fire(EventCount(value: 1));
              },
            ),
            AppButton(
              label: 'Dashboard Button - Decrementar valor',
              onPressed: () {
                Modular.get<EventBus>().fire(EventCount(value: -1));
              },
            ),
            AppButton(
              label: 'Dashboard Button - Show Modal!',
              onPressed: () {
                Modular.get<EventBus>()
                    .fire(EventModal('Modal vindo do DASHBOARD!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dashboard/src/dashboard/dashboard_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Início'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          AppButton(
            label: 'get Cats Facts',
            onPressed: () {
              // widget.controller.getCatFact();
              // Modular.get<EventBus>().fire(' Evento disparado! ');
            },
          ),
        ],
      ),
    );
  }
}

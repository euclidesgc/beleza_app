import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueci minha'),
      ),
      body: Column(
        children: [
          AppButton(
            label: 'Recuperar por SMS',
            onPressed: () => Modular.to.pushNamed('recovery_by_sms'),
          ),
          AppButton(
            label: 'Recuperar por Email',
            onPressed: () => Modular.to.pushNamed('recovery_by_email'),
          ),
        ],
      ),
    );
  }
}

import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AppTextInput(
              label: 'CPF, cód. de re ou e-mail:',
            ),
            const SizedBox(height: 16),
            const AppTextInput(
              label: 'Senha',
            ),
            TextButton(
              child: const Text('Esqueci a senha'),
              onPressed: () => Modular.to.pushNamed('forgot_password'),
            ),
            AppButton(
              label: 'Entrar',
              onPressed: () => Modular.to.pushNamed('/dashboard/'),
            ),
          ],
        ),
      ),
    );
  }
}

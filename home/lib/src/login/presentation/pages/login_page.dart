import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/presentation/pages/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tecEmail =
      TextEditingController(text: 'euclides.catunda@gmail.com');
  TextEditingController tecPassword =
      TextEditingController(text: 'Gb@32648.00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextInput(
                label: 'E-mail:',
                controller: tecEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextInput(
                label: 'Senha',
                obscureText: true,
                controller: tecPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua senha';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text('Esqueci a senha'),
                  onPressed: () => Modular.to.pushNamed('forgot_password'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: AppButton(
                  label: 'Entrar',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnackBar(context: context, message: 'Aguarde...');

                      widget.controller.login(
                        AuthParamsEntity(
                          login: tecEmail.text,
                          password: tecPassword.text,
                        ),
                      );
                      // Modular.to.pushNamed('/dashboard/inicio');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/domain/usecases/authorize_usecase.dart';
import 'package:home/src/login/presentation/login/bloc/login_bloc.dart';
import 'package:package_manager/package_manager.dart';

class LoginPage extends StatefulWidget {
  final AuthorizeUsecase authorizeUsecase;

  const LoginPage({
    Key? key,
    required this.authorizeUsecase,
  }) : super(key: key);

  static Widget route({required AuthorizeUsecase authorizeUsecase}) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authorizeUsecase: authorizeUsecase,
      ),
      child: LoginPage(
        authorizeUsecase: authorizeUsecase,
      ),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController(
    text: 'euclides.catunda@gmail.com',
  );
  TextEditingController tecPassword = TextEditingController(
    text: 'Gb@32648.00',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadSuccess) {
            Modular.to.navigate('/dashboard/inicio');
          }
          if (state is LoginLoadFailure) {
            AppAlertDialog.showAlertDialog(context, 'Errou!');
          }
        },
        builder: (context, state) {
          return Padding(
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
                  AppButton(
                    label: 'Entrar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final authParamsEntity = AuthParamsEntity(
                          login: tecEmail.text,
                          password: tecPassword.text,
                        );

                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginRequested(authParamsEntity));
                      }
                    },
                  ),
                  if (state is LoginLoadInProgress)
                    const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

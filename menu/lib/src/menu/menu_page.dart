import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          AppButton(
            label: 'Perfil',
            onPressed: () => Modular.to.pushNamed('/perfil'),
          ),
          AppButton(
            label: 'Meu Clube Boti',
            onPressed: () => Modular.to.pushNamed('/clube_boti'),
          ),
          AppButton(
            label: 'Divulgar',
            onPressed: () => Modular.to.pushNamed('/divulgar'),
          ),
          AppButton(
            label: 'Pedidos',
            onPressed: () => Modular.to.pushNamed('/pedidos'),
          ),
          AppButton(
            label: 'Treinamentos',
            onPressed: () => debugPrint('Treinamentos'),
          ),
          AppButton(
            label: 'Atendimento',
            onPressed: () => debugPrint('Atendimento'),
          ),
          AppButton(
            label: 'Avalie o app na loja',
            onPressed: () => debugPrint('Avalie o App'),
          ),
          AppButton(
            label: 'Envie sua sugestão',
            onPressed: () => debugPrint('Enviar sugestão'),
          ),
          AppButton(
            label: 'Política de privacidade',
            onPressed: () => debugPrint('Política de privacidade'),
          ),
          AppButton(
            label: 'Sair do app',
            onPressed: () =>
                Modular.to.popUntil(ModalRoute.withName('/home/login')),
          ),
        ],
      ),
    );
  }
}

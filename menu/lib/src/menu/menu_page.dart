import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          AppButton(
            label: 'Perfil',
            onPressed: () => Modular.to.pushNamed('/profile/'),
          ),
          AppButton(
            label: 'Meu Clube Boti',
            onPressed: () => Modular.to.pushNamed('/clube_boti/'),
          ),
          AppButton(
            label: 'Divulgar',
            onPressed: () => Modular.to.navigate('/dashboard/disseminate/'),
          ),
          AppButton(
            label: 'Pedidos',
            onPressed: () => Modular.to.navigate('/dashboard/orders/'),
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
            onPressed: () => Modular.to.navigate('/home/login'),
          ),
        ],
      ),
    );
  }
}

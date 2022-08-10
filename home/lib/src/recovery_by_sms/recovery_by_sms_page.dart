import 'package:flutter/material.dart';

class RecoveryBySmsPage extends StatelessWidget {
  const RecoveryBySmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueci minha senha'),
      ),
      body: const Text('Informe seu celular'),
    );
  }
}

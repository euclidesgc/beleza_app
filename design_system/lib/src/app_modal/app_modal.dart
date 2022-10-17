import 'package:flutter/material.dart';

class AppModal extends StatelessWidget {
  final String message;

  const AppModal({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Modal'),
        automaticallyImplyLeading: true,
      ),
      body: Center(child: Text(message)),
    );
  }
}

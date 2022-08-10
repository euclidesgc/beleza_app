import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String label;

  const AppTextInput({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

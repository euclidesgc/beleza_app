import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String message,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: MediaQuery.of(context).size.width * 0.80,
        content: const Text('Validando...'),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
      ),
    );

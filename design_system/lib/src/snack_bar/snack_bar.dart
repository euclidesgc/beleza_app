import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String message,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Aguarde...'),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 50,
          left: 16,
          right: 16,
        ),
      ),
    );

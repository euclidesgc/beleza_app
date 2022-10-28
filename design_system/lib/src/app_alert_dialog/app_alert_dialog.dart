import 'package:flutter/material.dart';

class AppAlertDialog {
  static showAlertDialog(BuildContext context, String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class BottomMenuController implements Disposable {
  final pageViewController = PageController();

  int selectItem = 0;

  @override
  void dispose() {
    pageViewController.dispose();
  }
}

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

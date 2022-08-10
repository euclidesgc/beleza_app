import 'package:core/core.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

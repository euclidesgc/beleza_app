import 'dart:developer';

import 'package:beleza_app/splash/pages/splash_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

void main() async {
  runApp(const SplashPage(message: 'Quase pronto...'));

  //Execução de várias chamadas em paralelo
  log('${DateTime.now()}');
  await Future.wait([
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
    Future.delayed(const Duration(seconds: 3)),
  ]);
  log('${DateTime.now()}');

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

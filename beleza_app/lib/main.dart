import 'package:beleza_app/splash/pages/splash_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

void main() async {
  runApp(const SplashPage());
  // Inciar Firebase Analytics
  // Inciar Firebase Crashdlotics
  // Inciar Armazenamento local
  await Future.delayed(const Duration(seconds: 3));
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

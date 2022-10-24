import 'dart:developer';

import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/domain/usecases/authorize_usecase.dart';

class LoginController {
  final AuthorizeUsecase authorizeUsecase;

  LoginController({
    required this.authorizeUsecase,
  });

  login(AuthParamsEntity authParams) async {
    try {
      final response = await authorizeUsecase.call(authParams: authParams);

      // var userSession = Modular.get<UserSession>();

      Modular.to.pushNamed('/dashboard/inicio');
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}

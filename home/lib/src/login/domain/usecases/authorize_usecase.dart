import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/domain/repositories/authorize_repository.dart';

class AuthorizeUsecase {
  final AuthorizeRepository authorizeRepository;

  AuthorizeUsecase({
    required this.authorizeRepository,
  });

  Future<AuthResponseEntity> call({required AuthParamsEntity authParams}) {
    try {
      return authorizeRepository(authParams: authParams);
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}

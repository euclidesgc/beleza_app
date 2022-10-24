import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:home/src/login/data/models/models.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/domain/repositories/authorize_repository.dart';
import 'package:home/src/login/infrastructure/datasources/authorize_datasource.dart';

class AuthorizeRepositoryImpl implements AuthorizeRepository {
  final AuthorizeDatasource authorizeDatasource;

  const AuthorizeRepositoryImpl({
    required this.authorizeDatasource,
  });

  @override
  Future<AuthResponseEntity> call(
      {required AuthParamsEntity authParams}) async {
    try {
      final authParamsModel = AuthParamsModel(
          login: authParams.login, password: authParams.password);

      final response = await authorizeDatasource(authParams: authParamsModel);

      return AuthResponseEntity(
        accessToken: response.accessToken!,
        expires: response.expires!,
        refreshToken: response.refreshToken!,
      );
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:home/src/endpoints/endpoints.dart';
import 'package:home/src/login/data/models/models.dart';
import 'package:home/src/login/infrastructure/datasources/authorize_datasource.dart';
import 'package:shared/shared.dart';

class AuthorizeDatasourceImpl implements AuthorizeDatasource {
  final HttpClient httpClient;

  AuthorizeDatasourceImpl({required this.httpClient});

  @override
  Future<AuthResponseModel> call({required AuthParamsModel authParams}) async {
    try {
      const url = AUTH_PATH;

      final response = await httpClient.request(
        url: url,
        verb: HttpVerb.POST,
        data: {
          "email": authParams.login.trim(),
          "password": authParams.password.trim(),
        },
      );

      final data = Map<String, dynamic>.from(response.data)['data'];
      return AuthResponseModel.fromMap(data);
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error: ${error.toString()}', error: error, stackTrace: stack);
      }
      rethrow;
    }
  }
}

// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/login/data/datasources/authorize_datasource_impl.dart';
import 'package:home/src/login/domain/entities/entities.dart';
import 'package:home/src/login/domain/repositories/authorize_repository.dart';
import 'package:home/src/login/domain/usecases/authorize_usecase.dart';
import 'package:home/src/login/infrastructure/datasources/authorize_datasource.dart';
import 'package:home/src/login/infrastructure/repositories/authorize_repository_impl.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture.dart';

class HttpClientMock extends Mock implements DioClientImpl {}

void main() {
  late DioClientImpl client;
  late AuthorizeDatasource datasource;
  late AuthorizeRepository repository;
  late AuthorizeUsecase authorizeUsecase;

  setUpAll(() {
    registerFallbackValue(HttpClientMock());
    client = HttpClientMock();
    datasource = AuthorizeDatasourceImpl(httpClient: client);
    repository = AuthorizeRepositoryImpl(authorizeDatasource: datasource);
    authorizeUsecase = AuthorizeUsecase(authorizeRepository: repository);
  });

  test('shold get a AuthResponseEntity', () async {
    when(() => client.request(
        url: any(named: 'url'),
        verb: HttpVerb.POST,
        data: any(named: 'data'),
        headers: any(named: 'headers'),
        options: any(named: 'options'),
        params: any(named: 'params'))).thenAnswer(
      (_) async => Future.value(
        ClientResponse(
          statusCode: 200,
          data: jsonDecode(fixture(fileName: 'auth_response.json')),
          header: '',
        ),
      ),
    );

    final response = await authorizeUsecase(
      authParams: AuthParamsEntity(
        login: 'euclides.catunda@gmail.com',
        password: 'Gb@32648.00',
      ),
    );
  });
}

import 'dart:convert';

import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/src/http_client/http_client.dart';
import 'package:shared/src/http_client/http_error.dart';

class DioClientImpl implements HttpClient {
  final List<Interceptor>? interceptors;
  final String? baseUrl;

  DioClientImpl({
    this.interceptors,
    this.baseUrl,
  });

  @override
  Future<ClientResponse> request({
    required String url,
    required HttpVerb verb,
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl ?? ''));

    if (interceptors != null && interceptors!.isNotEmpty) {
      dio.interceptors.addAll(interceptors!);
    }

    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(await _getHeaders(url));

    final jsonBody = data != null ? jsonEncode(data) : null;

    final defaultOptions = options ??
        Options(
          method: verb.name,
          headers: defaultHeaders,
        );

    late Response response;

    try {
      switch (verb) {
        case HttpVerb.GET:
          response = await dio.get(
            url,
            queryParameters: params,
            options: defaultOptions,
          );
          break;
        case HttpVerb.POST:
          response = await dio.post(
            url,
            data: jsonBody,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PUT:
          response = await dio.put(
            url,
            data: jsonBody,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PATCH:
          response = await dio.patch(
            url,
            data: jsonBody,
            options: defaultOptions,
          );
          break;
        case HttpVerb.DELETE:
          response = await dio.delete(
            url,
            data: jsonBody,
            options: defaultOptions,
          );
          break;
        default:
          throw HttpError();
      }
    } catch (error) {
      throw HttpError();
    }
    return _handleResponse(response);
  }

  ClientResponse _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return ClientResponse(
          statusCode: response.statusCode!,
          data: response.data,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 204:
        return ClientResponse(
          statusCode: response.statusCode!,
          data: null,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 400:
        throw BadRequestError();
      case 401:
        throw UnauthorizedError();
      case 403:
        throw ForbiddenError();
      case 404:
        throw NotFoundError();
      case 422:
        throw UnprocessableEntityError(data: response.data);
      default:
        throw ServerError();
    }
  }

  static Future<Map<String, String>> _getHeaders(String path) async {
    Map<String, String> requestHeaders = {
      "accept": "application/json, text/plain, */*",
      "content-type": "application/json",
    };

    return requestHeaders;
  }
}

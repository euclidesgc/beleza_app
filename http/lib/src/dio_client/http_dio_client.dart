import 'dart:convert';

import 'package:dio/dio.dart';

import '../http_error.dart';
import '../i_http_client.dart';
import '../models/models.dart';

class HttpDioClient implements IHttpClient {
  final Dio _dio;

  HttpDioClient(this._dio, {List<Interceptor> interceptors = const []}) {
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  @override
  Future<ClientResponse> request({
    required String url,
    required MethodHttp method,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(await _getHeaders(url));
    final jsonBody = data != null ? jsonEncode(data) : null;
    final defaultOptions =
        options ?? Options(method: method.name, headers: defaultHeaders);
    var response =
        Response(statusCode: 500, requestOptions: RequestOptions(path: ''));

    try {
      switch (method) {
        case MethodHttp.GET:
          response = await _dio.get(url,
              queryParameters: params, options: defaultOptions);
          break;
        case MethodHttp.POST:
          response =
              await _dio.post(url, data: jsonBody, options: defaultOptions);
          break;
        case MethodHttp.PUT:
          response =
              await _dio.put(url, data: jsonBody, options: defaultOptions);
          break;
        case MethodHttp.DELETE:
          response =
              await _dio.delete(url, data: jsonBody, options: defaultOptions);
          break;
        default:
          throw HttpError();
      }
    } catch (error) {
      throw HttpError();
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return ClientResponse(
          statusCode: response.statusCode!,
          body: (response.data == null || response.data.isEmpty)
              ? null
              : response.data,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 204:
        return ClientResponse(
          statusCode: response.statusCode!,
          body: null,
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
        throw UnprocessableEntityError(
            data: (response.data == null || response.data.isEmpty)
                ? null
                : response.data);
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

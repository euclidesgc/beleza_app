import 'package:http/src/models/method_http.dart';

import 'models/client_response.dart';

abstract class IHttpClient {
  Future<ClientResponse> request(
      {required String url,
      required MethodHttp method,
      Map<String, dynamic>? params,
      dynamic data,
      Map<String, dynamic>? headers});
}

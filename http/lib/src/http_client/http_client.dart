// ignore_for_file: constant_identifier_names

abstract class HttpClient {
  Future<ClientResponse> request(
      {required String url,
      required HttpVerb verb,
      Map<String, dynamic>? params,
      dynamic data,
      Map<String, dynamic>? headers});
}

class ClientResponse {
  final int statusCode;
  final dynamic data;
  final dynamic header;

  ClientResponse({
    required this.statusCode,
    this.data,
    this.header,
  });
}

enum HttpVerb {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

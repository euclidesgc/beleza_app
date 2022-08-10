class ClientResponse {
  final int statusCode;
  final dynamic body;
  final dynamic header;

  ClientResponse({required this.statusCode, this.body, this.header});
}

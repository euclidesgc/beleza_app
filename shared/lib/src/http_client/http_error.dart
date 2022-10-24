class HttpError implements Exception {}

class BadRequestError extends HttpError {}

class NotFoundError extends HttpError {}

class ServerError extends HttpError {}

class UnauthorizedError extends HttpError {}

class ForbiddenError extends HttpError {}

class InvalidDataError extends HttpError {}

class UnprocessableEntityError extends HttpError {
  final Map<String, dynamic>? data;
  UnprocessableEntityError({this.data});
}

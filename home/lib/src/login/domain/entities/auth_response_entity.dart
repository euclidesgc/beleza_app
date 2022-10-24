class AuthResponseEntity {
  final String accessToken;
  final int expires;
  final String refreshToken;

  AuthResponseEntity({
    required this.expires,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  String toString() =>
      'AuthResponse(accessToken: $accessToken, expires: $expires, refreshToken: $refreshToken)';
}

class AuthParamsEntity {
  final String login;
  final String password;

  AuthParamsEntity({
    required this.login,
    required this.password,
  });

  @override
  String toString() => 'AuthParamsEntity(login: $login, password: $password)';
}

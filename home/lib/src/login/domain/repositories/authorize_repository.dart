import 'package:home/src/login/domain/entities/entities.dart';

abstract class AuthorizeRepository {
  Future<AuthResponseEntity> call({required AuthParamsEntity authParams});
}

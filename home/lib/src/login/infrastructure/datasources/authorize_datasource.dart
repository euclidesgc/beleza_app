import 'package:home/src/login/data/models/models.dart';

abstract class AuthorizeDatasource {
  Future<AuthResponseModel> call({required AuthParamsModel authParams});
}

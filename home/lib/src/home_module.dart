import 'package:external_dependencies/external_dependencies.dart';
import 'package:home/src/endpoints/endpoints.dart';
import 'package:home/src/login/data/datasources/authorize_datasource_impl.dart';
import 'package:home/src/login/domain/repositories/authorize_repository.dart';
import 'package:home/src/login/domain/usecases/authorize_usecase.dart';
import 'package:home/src/login/infrastructure/datasources/authorize_datasource.dart';
import 'package:home/src/login/infrastructure/repositories/authorize_repository_impl.dart';
import 'package:home/src/login/presentation/pages/login_controller.dart';
import 'package:shared/shared.dart';

import 'forgot_password/forgot_password_page.dart';
import 'login/presentation/pages/login_page.dart';
import 'recovery_by_email/recovery_by_email_page.dart';
import 'recovery_by_sms/recovery_by_sms_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<HttpClient>(
          (i) => DioClientImpl(baseUrl: BASE_URL),
        ),
        Bind.lazySingleton<AuthorizeDatasource>(
          (i) => AuthorizeDatasourceImpl(httpClient: i()),
        ),
        Bind.lazySingleton<AuthorizeRepository>(
          (i) => AuthorizeRepositoryImpl(authorizeDatasource: i()),
        ),
        Bind.lazySingleton<AuthorizeUsecase>(
          (i) => AuthorizeUsecase(authorizeRepository: i()),
        ),
        Bind.lazySingleton<LoginController>(
          (i) => LoginController(authorizeUsecase: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login',
            child: (_, args) => LoginPage(
                  controller: Modular.get<LoginController>(),
                )),
        ChildRoute('/forgot_password',
            child: (_, args) => const ForgotPasswordPage()),
        ChildRoute('/recovery_by_sms',
            child: (_, args) => const RecoveryBySmsPage()),
        ChildRoute('/recovery_by_email',
            child: (_, args) => const RecoveryByEmailPage()),
      ];
}

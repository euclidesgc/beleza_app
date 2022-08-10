import 'package:external_dependencies/external_dependencies.dart';

import 'forgot_password/forgot_password_page.dart';
import 'login/login_page.dart';
import 'recovery_by_email/recovery_by_email_page.dart';
import 'recovery_by_sms/recovery_by_sms_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (_, args) => const LoginPage()),
        ChildRoute('/forgot_password',
            child: (_, args) => const ForgotPasswordPage()),
        ChildRoute('/recovery_by_sms',
            child: (_, args) => const RecoveryBySmsPage()),
        ChildRoute('/recovery_by_email',
            child: (_, args) => const RecoveryByEmailPage()),
      ];
}

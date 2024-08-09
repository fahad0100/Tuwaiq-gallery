import 'package:shelf_router/shelf_router.dart';
import '../handlers/auth/create_account_user_handler.dart';
import '../handlers/auth/login_account_user_handler.dart';
import '../handlers/auth/resend_code_handler.dart';
import '../handlers/auth/verfy_account_user_handler.dart';

class AuthRoute {
  Router get route {
    final router = Router()
      ..post('/create/new/account', createAccountUserHandler)
      ..post('/login', loginAccountUserHandler)
      ..post('/verify', verifyHandler)
      ..post('/resend', resendNewCodeHandler);

    return router;
  }
}

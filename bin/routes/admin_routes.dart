import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/admin/change_role_user_handler.dart';
import '../middleware/admin_middleware.dart';

class AdminRoute {
  Handler get route {
    final router = Router()
      ..put('/change/role/user', changeRoleUserAdminHandler);
    final handler =
        Pipeline().addMiddleware(adminMiddleware).addHandler(router.call);

    return handler;
  }
}

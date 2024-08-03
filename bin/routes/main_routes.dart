import 'package:shelf_router/shelf_router.dart';

import '../handlers/public/get_project_by_id_handler copy.dart';
import '../handlers/public/get_projects_handler.dart';
import 'admin_routes.dart';
import 'auth_routes.dart';
import 'supervisor_routes.dart';
import 'user_routes.dart';

class MainRoute {
  Router get route {
    final router = Router()
      ..mount('/auth', AuthRoute().route.call)
      ..mount('/admin', AdminRoute().route.call)
      ..mount('/supervisor', SupervisorRoute().route.call)
      ..mount('/user', UserRoute().route.call)
      ..get('/get/project/<id>', getProjectByIDHandler)
      ..get('/projects', searchProjectHandler);

    return router;
  }
}

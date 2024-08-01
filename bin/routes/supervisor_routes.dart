import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/supervisor/change_status_project_supervisor_handler.dart';
import '../handlers/supervisor/create_project_from_supervisor_handler.dart';
import '../handlers/supervisor/deleted_project_supervisor_handler.dart';
import '../handlers/supervisor/profile_supervisor_handler.dart';
import '../middleware/supervisor_middleware.dart';

class SupervisorRoute {
  Handler get route {
    final router = Router()
      ..post('/create/project', createProjectFromSupervisorHandler)
      ..get('/profile', profileSupervisorHandler)
      ..put('/change/status/<id>', changeStatusProjectSupervisorHandler)
      ..delete('/delete/project/<id>', deleteProjectSupervisorHandler);
    final handler =
        Pipeline().addMiddleware(supervisorMiddleware).addHandler(router.call);

    return handler;
  }
}

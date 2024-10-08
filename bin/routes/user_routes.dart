import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/profile/profile_user_handler.dart';
import '../handlers/users/dashbord/calclater.dart';
import '../handlers/users/update_project/update_base_projects_user_handler.dart';
import '../handlers/users/update_project/update_logo_projects_user_handler.dart';
import '../handlers/users/update_project/update_presentation_projects_user_handler.dart';
import '../handlers/users/rating/rating_project_handler.dart';
import '../handlers/users/update_project/update_images_projects_user_handler.dart';
import '../handlers/users/update_project/update_link_projects_user_handler.dart';
import '../handlers/users/update_project/update_members_projects_user_handler copy 3.dart';
import '../handlers/profile/update_profile_profile_user_handler.dart';
import '../middleware/user_middleware.dart';

class UserRoute {
  Handler get route {
    final router = Router()
      ..get('/profile', profileUserHandler)
      ..put('/update/profile', updateProfileUserHandler)
      ..put('/edit/project/base/<id>', editBaseProjectUserHandler)
      ..put('/edit/project/logo/<id>', editLogoProjectUserHandler)
      ..put(
          '/edit/project/presentation/<id>', editPresentationProjectUserHandler)
      ..put('/edit/project/images/<id>', editImagesProjectUserHandler)
      ..put('/edit/project/link/<id>', editLinkProjectUserHandler)
      ..put('/edit/project/members/<id>', editMembersProjectUserHandler)
      ..post('/rating/project/<id>', ratingProjectHandler)
      ..get('/calculateHandler/<id>', calculateHandler);

    final handler =
        Pipeline().addMiddleware(userMiddleware).addHandler(router.call);

    return handler;
  }
}

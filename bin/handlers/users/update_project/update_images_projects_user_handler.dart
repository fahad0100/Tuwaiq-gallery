import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../helper/upload_to_supabase/upload_projects/upload_images_project.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';
import 'update_base_projects_user_handler.dart';

Future<Response> editImagesProjectUserHandler(Request req, String id) async {
  try {
    ProjectModel body = ProjectModel.fromJsonImagesRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);

    body =
        await checkBeforeEditProject(body: body, id: id, tokenData: userToken);

    final futures = <Future>[
      uploadImagesProject(images: body.images!, projectId: id),
      SupabaseIntegration.supabase!
          .rpc('update_project_updated_at', params: {"id": id})
    ];

    await Future.wait(futures);
    final result = await getProjectsForOwner(idProject: body.projectId!);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

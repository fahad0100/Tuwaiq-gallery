import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/token.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';
import 'update_members_projects_user_handler copy 3.dart';

Future<Response> editLinkProjectUserHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    final body = ProjectModel.fromJsonLinkRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);
    body.projectId = id;
    final projectData = await SupabaseIntegration.supabase!
        .from("projects")
        .select('*')
        .eq('project_id', id)
        .maybeSingle();

    if (projectData == null) {
      throw NotFoundException(message: "No project found");
    }
    body.fromDataBaseCheckerFirst(projectData);
    if (userToken.idDataBase != body.userId || !body.allowEdit!) {
      throw FormatException("Not allowed to edit this project");
    }
//?--------------
    if (body.link!.isNotEmpty) {
      final futures = <Future>[
        SupabaseIntegration.supabase!
            .from("links_project")
            .upsert(body.toJsonUpdateLink())
            .select("*"),
        SupabaseIntegration.supabase!
            .from("projects")
            .select("*,images_project(*),links_project(*),members_project(*)")
            .eq('project_id', id)
            .eq('user_id', userToken.idDataBase)
            .eq('allow_edit', true)
            .single(),
        SupabaseIntegration.supabase!
            .rpc('update_project_updated_at', params: {"id": id})
      ];

      await Future.wait(futures);
    }
    final result = await getProjectsForOwner(
        idProject: body.projectId!, idUser: userToken.idDataBase);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

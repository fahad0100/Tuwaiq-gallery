import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';
import '../../../helper/get_data_supabase/check_before_edit_project.dart';

Future<Response> editLinkProjectUserHandler(Request req, String id) async {
  try {
    ProjectModel body = ProjectModel.fromJsonLinkRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);

    body =
        await checkBeforeEditProject(body: body, id: id, tokenData: userToken);
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
            .eq('user_id', body.userId!)
            .eq('allow_edit', true)
            .single(),
        SupabaseIntegration.supabase!
            .rpc('update_project_updated_at', params: {"id": id})
      ];

      await Future.wait(futures);
    }
    final result = await getProjectsForOwner(idProject: body.projectId!);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

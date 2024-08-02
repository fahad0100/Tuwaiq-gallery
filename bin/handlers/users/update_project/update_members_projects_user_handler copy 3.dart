import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';
import 'update_base_projects_user_handler.dart';

Future<Response> editMembersProjectUserHandler(Request req, String id) async {
  try {
    ProjectModel body = ProjectModel.fromJsonMembersRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);

    body =
        await checkBeforeEditProject(body: body, id: id, tokenData: userToken);

    await SupabaseIntegration.supabase!
        .from("members_project")
        .delete()
        .eq('project_id', id)
        .select();
    await SupabaseIntegration.supabase!
        .from("members_project")
        .upsert(body.toJsonUpdateMembers())
        .eq('project_id', id)
        .select();

    await SupabaseIntegration.supabase!
        .rpc('update_project_updated_at', params: {"id": id});
    final result = await getProjectsForOwner(idProject: body.projectId!);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

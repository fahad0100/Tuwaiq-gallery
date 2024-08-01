import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';

Future<Response> editMembersProjectUserHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    final body = ProjectModel.fromJsonMembersRequestEdit(
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

    await SupabaseIntegration.supabase!
        .from("members_project")
        .upsert(body.toJsonUpdateMembers())
        .eq('project_id', id)
        .select();

    await SupabaseIntegration.supabase!
        .rpc('update_project_updated_at', params: {"id": id});
    final result = await getProjectsForOwner(
        idProject: body.projectId!, idUser: userToken.idDataBase);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

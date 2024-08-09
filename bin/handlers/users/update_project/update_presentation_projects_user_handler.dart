import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../helper/upload_to_supabase/upload_projects/upload_presentation_project.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';
import '../../../helper/get_data_supabase/check_before_edit_project.dart';

Future<Response> editPresentationProjectUserHandler(
    Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    ProjectModel body = ProjectModel.fromJsonPresentationRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);

    body =
        await checkBeforeEditProject(body: body, id: id, tokenData: userToken);

    await uploadPresentationProject(
        presentation: body.presentation!, projectId: body.projectId!);
    await SupabaseIntegration.supabase!
        .rpc('update_project_updated_at', params: {"id": id});
    final result = await getProjectsForOwner(idProject: body.projectId!);
    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

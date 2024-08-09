import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/check_before_edit_project.dart';
import '../../../helper/get_data_supabase/get_projects_for_owner.dart';
import '../../../helper/token.dart';
import '../../../helper/upload_to_supabase/upload_projects/upload_logo_project.dart';
import '../../../helper/upload_to_supabase/upload_projects/upload_presentation_project.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_model.dart';

Future<Response> editBaseProjectUserHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    ProjectModel body = ProjectModel.fromJsonBaseRequestEdit(
        json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);

    body =
        await checkBeforeEditProject(body: body, id: id, tokenData: userToken);
    final futures = <Future>[
      if (body.projectLogo != null)
        uploadLogoProject(logo: body.projectLogo!, projectId: body.projectId!),
      if (body.presentation != null)
        uploadPresentationProject(
            presentation: body.presentation!, projectId: body.projectId!),
      SupabaseIntegration.supabase!
          .from("projects")
          .update(body.toJsonUpdateBase())
          .eq('project_id', id)
          .eq('user_id', body.userId!)
          .eq('allow_edit', true)
          .select("*,images_project(*),links_project(*),members_project(*)")
          .single()
    ];
    await Future.wait(futures);

    final result = await getProjectsForOwner(idProject: body.projectId!);

    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

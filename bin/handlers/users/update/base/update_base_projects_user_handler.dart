import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../../../customize/exception.dart';
import '../../../../customize/response.dart';
import '../../../../helper/token.dart';
import '../../../../helper/upload_to_supabase/upload_projects/upload_logo_project.dart';
import '../../../../helper/upload_to_supabase/upload_projects/upload_presentation_project.dart';
import '../../../../helper/validations/validations.dart';
import '../../../../integration/supabase/supabase_integration.dart';
import '../../../../models/project_model.dart';
import '../update_members_projects_user_handler copy 3.dart';

Future<Response> editBaseProjectUserHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    final body = ProjectModel.fromJsonBaseRequestEdit(
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
          .eq('user_id', userToken.idDataBase)
          .eq('allow_edit', true)
          .select("*,images_project(*),links_project(*),members_project(*)")
          .single()
    ];
    await Future.wait(futures);

    final result = await getProjectsForOwner(
        idProject: body.projectId!, idUser: userToken.idDataBase);

    return ResponseClass()
        .succeedResponse(message: "success", data: result.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

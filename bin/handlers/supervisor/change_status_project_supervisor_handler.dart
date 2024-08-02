import 'dart:convert';
import 'package:postgrest/src/types.dart';
import 'package:shelf/shelf.dart';
import '../../customize/exception.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../helper/validations/validations.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/initial_project_model.dart';
import '../../models/users/project_deletes.dart';

changeStatusProjectSupervisorHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    final body =
        InitialProjectModel.fromToUpdate(json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);
    if (userToken.roleUser == "user") {
      throw FormatException("you should be supervisor to create project");
    }
    PostgrestList? projectInit;
    if (userToken.roleUser == "admin") {
      projectInit = await SupabaseIntegration.supabase
          ?.from('projects')
          .update(body.toJson())
          .eq('project_id', id)
          .select(
              "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))");
    } else {
      projectInit = await SupabaseIntegration.supabase
          ?.from('projects')
          .update(body.toJson())
          .eq('project_id', id)
          .eq('admin_id', userToken.idDataBase)
          .select(
              "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))");
    }
    if (projectInit!.isEmpty) {
      throw NotFoundException(message: "No project found");
    }

    final data = ProjectsDetails.fromJson(projectInit.first);

    return ResponseClass()
        .succeedResponse(message: "success", data: data.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

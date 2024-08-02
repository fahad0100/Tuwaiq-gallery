import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/initial_project_model.dart';
import '../../models/users/user_details.dart';

createProjectFromSupervisorHandler(Request req) async {
  try {
    final body =
        InitialProjectModel.fromJson(json.decode(await req.readAsString()));
    final userToken = await getTokenFromHeader(req: req);
    body.adminId = userToken.idDataBase;
    final userFound = await SupabaseIntegration.supabase
        ?.from('users')
        .select("*")
        .eq("id", body.userId!)
        .maybeSingle();
    if (userFound == null) {
      throw FormatException(
          "You tried to create a project for a user not found.");
    }
    UserDetails user = UserDetails.fromJson(userFound);
    if (user.role != "user" && userToken.roleUser == "supervisor") {
      throw FormatException("Only create a project for a user");
    }
    final projectInit = await SupabaseIntegration.supabase
        ?.from('projects')
        .insert(body.toJson())
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .single();
    return ResponseClass()
        .succeedResponse(message: "success", data: projectInit);
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../integration/supabase/supabase_integration.dart';

profileSupervisorHandler(Request req) async {
  try {
    final user = await getTokenFromHeader(req: req);
    final userProfile = await SupabaseIntegration.supabase
        ?.from('users')
        .select("*,user_account(linkedin,github,resume,bindlink),projects(*)")
        .eq("id", user.idDataBase)
        .eq("projects.admin_id", user.idDataBase)
        .single();
    final project = await SupabaseIntegration.supabase
        ?.from('projects')
        .select("*")
        .eq("admin_id", user.idDataBase);
    userProfile!["projects"] = project;
    return ResponseClass()
        .succeedResponse(message: "success", data: userProfile);
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

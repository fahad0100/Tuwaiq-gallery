import 'package:shelf/shelf.dart';
import '../../customize/exception.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../helper/upload_to_supabase/upload/upload_image.dart';
import '../../helper/validations/validations.dart';
import '../../integration/supabase/supabase_integration.dart';

Future<Response> deleteProjectSupervisorHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");

    final user = await getTokenFromHeader(req: req);
    var x;
    if (user.roleUser == "admin") {
      x = await SupabaseIntegration.supabase
          ?.from('projects')
          .delete()
          .eq("project_id", id)
          .select("*");
    } else {
      x = await SupabaseIntegration.supabase
          ?.from('projects')
          .delete()
          .eq("admin_id", user.idDataBase)
          .eq("project_id", id)
          .select("*");
    }

    if (x!.isEmpty) {
      throw NotFoundException(message: "Not found project");
    }
    await forDeleteAllFileProjects(id: id);

    return ResponseClass().succeedResponse(
        message: "success",
        data: "Project has id: ($id) is deleted successfully");
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

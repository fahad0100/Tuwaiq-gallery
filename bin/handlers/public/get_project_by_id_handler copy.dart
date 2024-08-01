import 'package:shelf/shelf.dart';
import '../../customize/exception.dart';
import '../../customize/response.dart';
import '../../helper/validations/validations.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/project_deletes.dart';

getProjectByIDHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");
    final result = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq('project_id', id)
        .eq('is_public', true)
        .maybeSingle();
    if (result == null) {
      throw NotFoundException(message: "No project found");
    }

    final data = ProjectsDetails.fromJson(result);
    return ResponseClass()
        .succeedResponse(message: "success", data: data.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

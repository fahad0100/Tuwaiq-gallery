import '../../customize/exception.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/project_model.dart';
import '../../models/token_model.dart';
import '../validations/validations.dart';

Future<ProjectModel> checkBeforeEditProject({
  required String id,
  required TokenModel tokenData,
  required ProjectModel body,
}) async {
  Validation.isValidPrefixedUuid(prefix: 'p-', value: id, title: "ID project");
  body.projectId = id;
  var project = await SupabaseIntegration.supabase!
      .from("projects")
      .select('*')
      .eq('project_id', id)
      .maybeSingle();

  if (project == null) {
    throw NotFoundException(message: "No project found");
  }

  body.fromDataBaseCheckerFirst(project);

  switch (tokenData.roleUser) {
    case "admin":
      break;
    case "supervisor":
      if (tokenData.idDataBase != body.adminId &&
          tokenData.idDataBase != body.userId) {
        throw FormatException(
            "You are not his supervisor and therefore not allowed to edit this project.");
      }
      break;
    default:
      if (body.userId == tokenData.idDataBase && body.allowEdit == true) {
      } else {
        throw FormatException("Not allowed to edit this project.");
      }
  }

  return body;
}

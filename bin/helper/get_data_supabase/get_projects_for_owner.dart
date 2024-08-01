import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/project_deletes.dart';

Future<ProjectsDetails> getProjectsForOwner({
  required String idProject,
  required String idUser,
}) async {
  try {
    final project = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq('project_id', idProject)
        .eq('user_id', idUser)
        .single();

    return ProjectsDetails.fromJson(project);
  } catch (error) {
    throw FormatException("there error with casting data to user model");
  }
}

import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/project_deletes.dart';

Future<List<ProjectsDetails>> fetchAllProjects() async {
  List<Map<String, dynamic>>? projectsDataBase = await SupabaseIntegration
      .supabase
      ?.from('projects')
      .select(
          "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
      .eq("is_public", true)
      .order("create_at");

  List<ProjectsDetails> projects = [];

  for (var element in projectsDataBase ?? []) {
    projects.add(ProjectsDetails.fromJson(element));
  }

  return projects;
}

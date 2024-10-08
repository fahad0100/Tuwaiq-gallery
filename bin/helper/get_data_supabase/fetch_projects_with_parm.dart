import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/project_deletes.dart';

Future<List<ProjectsDetails>> fetchProjectsWithParm(
    {String? query, int? from, int? to}) async {
  print(":::>>>>>>>>>>>>>> $query");
  final rangeFrom = from ?? 0;
  final rangeTo = to ?? 99;
  if ((rangeTo - rangeFrom + 1) > 100) {
    throw FormatException("Range 'from' - 'to' should be less than 100");
  }

  List<Map<String, dynamic>>? projectsDataBase = [];
  if (query == null) {
    projectsDataBase = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("is_public", true)
        .range(rangeFrom, rangeTo)
        .order("create_at");
  } else {
    projectsDataBase = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("is_public", true)
        // .ilike(columnSearch, '%$valueSearch%')

        .range(rangeFrom, rangeTo)
        .order("create_at");
  }

  List<ProjectsDetails> projects = [];

  for (var element in projectsDataBase) {
    projects.add(ProjectsDetails.fromJson(element));
  }
  return projects;
}

import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/project_deltels.dart';

Future<Response> searchProjectHandler(Request req) async {
  try {
    final params = req.requestedUri.queryParameters;
    String? columnSearch;
    String? valueSearch;
    int? from;
    int? to;

    List<ProjectsDetails> responseResult = [];
    // Parse parameters
    params.forEach((key, value) {
      switch (key) {
        case 'name':
          columnSearch = 'project_name';
          valueSearch = value;
          break;
        case 'bootcamp':
          columnSearch = 'bootcamp_name';
          valueSearch = value;
          break;
        case 'type':
          columnSearch = 'type';
          valueSearch = value;
          break;
        case 'from':
          from = _parseRange(value);
          break;
        case 'to':
          to = _parseRange(value);
          break;
      }
    });

    // Validate range
    if (from != null && to != null && to! - from! + 1 > 100) {
      throw FormatException("Range 'from' - 'to' should be less than 100");
    }
    if (columnSearch == null &&
        valueSearch == null &&
        from == null &&
        to == null) {
      responseResult = await _fetchAllProjects();
    } else {
      responseResult =
          await _fetchProjects(columnSearch, valueSearch, from, to);
    }

    // Fetch projects from database

    return ResponseClass().succeedResponse(
        message: "success",
        data: {"count": responseResult.length, "projects": responseResult});
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

int _parseRange(String value) {
  final parsed = int.tryParse(value);
  if (parsed == null || parsed <= 0) {
    throw FormatException("Invalid range value: $value");
  }
  return parsed - 1;
}

Future<List<ProjectsDetails>> _fetchProjects(
    String? columnSearch, String? valueSearch, int? from, int? to) async {
  final rangeFrom = from ?? 0;
  final rangeTo = to ?? 99;
  if ((rangeTo - rangeFrom + 1) > 100) {
    throw FormatException("Range 'from' - 'to' should be less than 100");
  }

  List<Map<String, dynamic>>? projectsDataBase = [];
  if (columnSearch == null) {
    print("=0=0=0=0=0=0=");
    projectsDataBase = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("is_public", true)
        .range(rangeFrom, rangeTo)
        .order("create_at");
  } else {
    print("=1=1=1=11=1=11=1");
    projectsDataBase = await SupabaseIntegration.supabase!
        .from("projects")
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("is_public", true)
        .ilike(columnSearch, '%$valueSearch%')
        .range(rangeFrom, rangeTo)
        .order("create_at");
  }

  List<ProjectsDetails> projects = [];

  for (var element in projectsDataBase) {
    projects.add(ProjectsDetails.fromJson(element));
  }
  return projects;
}

//?-----------------

Future<List<ProjectsDetails>> _fetchAllProjects() async {
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

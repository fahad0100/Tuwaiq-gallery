import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/get_data_supabase/fetch_all_projects.dart';
import '../../helper/get_data_supabase/fetch_projects_with_parm.dart';
import '../../models/users/project_deletes.dart';

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
      responseResult = await fetchAllProjects();
    } else {
      responseResult =
          await fetchProjectsWithParm(columnSearch, valueSearch, from, to);
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

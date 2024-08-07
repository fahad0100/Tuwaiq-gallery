import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/get_data_supabase/fetch_all_projects.dart';
import '../../helper/get_data_supabase/fetch_projects_with_parm.dart';
import '../../models/users/project_deletes.dart';

Future<Response> searchProjectHandler(Request req) async {
  try {
    final params = req.requestedUri.queryParameters;
    List<ProjectsDetails> responseResult = [];

    print("params $params");

    if (params.isEmpty) {
      responseResult = await fetchAllProjects();
    } else {
      responseResult = await searchWithBarm(params: params);
    }

    // Fetch projects from database

    return ResponseClass().succeedResponse(
        message: "success",
        data: {"count": responseResult.length, "projects": responseResult});
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

searchWithBarm({required Map<String, String> params}) async {
  // String? columnSearch;
  // String? valueSearch;
  int? from;
  int? to;

  List keySearch = ['name', 'to', 'from', 'bootcamp', 'type', 'date', "rating"];

  // Parse parameters

  String query = '';
  params.forEach((key, value) {
    if (!keySearch.contains(key)) {
      throw FormatException("Can't search by this parm");
    }
    switch (key) {
      case 'name':
        // columnSearch = 'project_name';
        // valueSearch = value;
        String newQuery = 'project_name.ilike.%$value%';
        if (query.isEmpty) {
          query = newQuery;
        } else {
          query = '$query,$newQuery';
        }
        break;
      case 'rating':
        // columnSearch = 'rating';
        // valueSearch = value;
        // String newQuery = 'rating.eq.%${0.0}%';
        // if (query.isEmpty) {
        //   query = newQuery;
        // } else {
        //   query = '$query,$newQuery';
        // }
        break;
      case 'bootcamp':
        // columnSearch = 'bootcamp_name';
        // valueSearch = value;
        String newQuery = 'bootcamp_name.ilike.%$value%';
        if (query.isEmpty) {
          query = newQuery;
        } else {
          query = '$query,$newQuery';
        }
        break;
      case 'type':
        // columnSearch = 'type';
        // valueSearch = value;
        String newQuery = 'type.eq.%$value%';
        if (query.isEmpty) {
          query = newQuery;
        } else {
          query = '$query,$newQuery';
        }
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
  print("???>$query");
  final x = await fetchProjectsWithParm(from: from, to: to, query: query);

  return x;
}

int _parseRange(String value) {
  final parsed = int.tryParse(value);
  if (parsed == null || parsed <= 0) {
    throw FormatException("Invalid range value: $value");
  }
  return parsed - 1;
}

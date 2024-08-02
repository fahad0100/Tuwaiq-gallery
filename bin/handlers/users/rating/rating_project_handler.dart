import 'dart:convert';

import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_rating.dart';
import '../../../helper/token.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_evaluation_model.dart';

Future<Response> ratingProjectHandler(Request req, String id) async {
  try {
    final body =
        ProjectEvaluation.fromJson(json.decode(await req.readAsString()));

    final checkIFAllow = await SupabaseIntegration.supabase!
        .from("projects")
        .select()
        .eq('project_id', id)
        .eq('allow_rating', true);

    if (checkIFAllow.isEmpty) {
      throw NotFoundException(
          message: "Project not found or not allow to rating");
    }

    final userToken = await getTokenFromHeader(req: req);
    body.userId = userToken.idDataBase;
    body.projectId = id;

    await SupabaseIntegration.supabase!
        .from("project_evaluation")
        .upsert(body.toJson());

    final result = await getRating(idProjects: id);

    return ResponseClass()
        .succeedResponse(message: "success", data: {"rating": result});
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

import 'dart:convert';

import 'package:shelf/shelf.dart';
import '../../../customize/exception.dart';
import '../../../customize/response.dart';
import '../../../helper/get_data_supabase/get_rating.dart';
import '../../../helper/token.dart';
import '../../../helper/validations/validations.dart';
import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/project_evaluation_model.dart';

Future<Response> calculateHandler(Request req, String id) async {
  try {
    Validation.isValidPrefixedUuid(
        prefix: 'p-', value: id, title: "ID project");

    final result = await SupabaseIntegration.supabase!
        .from("project_evaluation")
        .select()
        .eq('project_id', id);

    final rating = method(result: result);

    return ResponseClass().succeedResponse(message: "success", data: rating);
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

method({required List<Map<String, dynamic>> result}) {
  final int countRating = result.length * 10;

  int countIdea = 0;
  int countDesign = 0;
  int countTools = 0;
  int countPractices = 0;
  int countPresentation = 0;
  int countInvestment = 0;
  List<String> comment = [];

  for (var element in result) {
    countIdea += element["idea"] as int;
    countDesign += element["design"] as int;
    countTools += element["tools"] as int;
    countPractices += element["practices"] as int;
    countPresentation += element["presentation"] as int;
    countInvestment += element["investment"] as int;
    comment.add(element["comment"]);
  }
  final ideaCH = (countIdea / countRating) * 5;
  final designCH = (countDesign / countRating) * 5;
  final toolsCH = (countTools / countRating) * 5;
  final practicesCH = (countPractices / countRating) * 5;
  final presentationCH = (countPresentation / countRating) * 5;
  final investmentCH = (countInvestment / countRating) * 5;

  return {
    "idea": num.parse(ideaCH.toStringAsFixed(2)),
    "design": num.parse(designCH.toStringAsFixed(2)),
    "tools": num.parse(toolsCH.toStringAsFixed(2)),
    "practices": num.parse(practicesCH.toStringAsFixed(2)),
    "presentation": num.parse(presentationCH.toStringAsFixed(2)),
    "investment": num.parse(investmentCH.toStringAsFixed(2)),
    "comment": comment,
  };
}

import '../../integration/supabase/supabase_integration.dart';

Future getRating({required String idProjects}) async {
  final response = await SupabaseIntegration.supabase!
      .from("project_evaluation")
      .select('total_score')
      .eq("project_id", idProjects);

  if (response.isEmpty) {
    return;
  }
  num totalGet =
      response.map((e) => e["total_score"] as num).reduce((a, b) => a + b);

  num total = 60 * response.length;
  num ratingGet = (totalGet / total) * 5;

  final double finalRating = double.parse(ratingGet.toStringAsFixed(2));

  await SupabaseIntegration.supabase!
      .from("projects")
      .update({"rating": finalRating})
      .eq("project_id", idProjects)
      .select();

  return finalRating;
}

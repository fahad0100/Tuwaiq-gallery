import 'dart:typed_data';

import '../../../integration/supabase/supabase_integration.dart';
import '../upload/upload_PDF.dart';

Future<void> uploadPresentationProject(
    {required String projectId, required List<int> presentation}) async {
  try {
    if (presentation.isEmpty) {
      throw FormatException("Error with upload empty presentation project");
    }
    try {
      final url = await uploadPDF(
          bucket: 'images',
          folder: 'projects.pdf',
          projectId: "$projectId-p",
          imageBinary: Uint8List.fromList(presentation));
      await SupabaseIntegration.supabase!
          .from("projects")
          .update({'presentation_url': url})
          .eq('project_id', projectId)
          .select();
    } catch (error) {
      throw FormatException("Error with Upload pdf project");
    }
  } catch (error) {
    rethrow;
  }
}

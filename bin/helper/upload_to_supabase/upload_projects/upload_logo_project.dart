import 'dart:typed_data';

import '../../../integration/supabase/supabase_integration.dart';
import '../upload/upload_image.dart';

Future<void> uploadLogoProject(
    {required String projectId, required List<int> logo}) async {
  try {
    if (logo.isEmpty) {
      throw FormatException("Error with Upload empty Logo project");
    }
    try {
      final url = await uploadImage(
          bucket: 'images',
          folder: 'projects_logo',
          projectId: "$projectId-logo",
          imageBinary: Uint8List.fromList(logo));
      await SupabaseIntegration.supabase!
          .from("projects")
          .update({'logo_url': url})
          .eq('project_id', projectId)
          .select();
    } catch (error) {
      throw FormatException("Error with Upload Logo project");
    }
  } catch (error) {
    rethrow;
  }
}

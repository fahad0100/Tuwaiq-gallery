import 'dart:typed_data';

import 'package:supabase/supabase.dart';

import '../../../integration/supabase/supabase_integration.dart';
import '../upload/upload_PDF.dart';

Future<void> uploadPresentationProject(
    {required String projectId, required List<int> presentation}) async {
  try {
    if (presentation.isEmpty) {
      throw FormatException("Error with upload empty presentation project");
    }

    final url = await uploadPDF(
        bucket: 'presentation',
        folder: null,
        projectId: "$projectId-p",
        imageBinary: Uint8List.fromList(presentation));
    await SupabaseIntegration.supabase!
        .from("projects")
        .update({'presentation_url': url})
        .eq('project_id', projectId)
        .select();
  } on StorageException catch (_) {
    throw StorageException("The size of presentation should be less than 2 MB");
  } catch (error) {
    throw FormatException(error.toString());
  }
}

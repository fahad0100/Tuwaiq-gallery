import 'dart:typed_data';

import 'package:supabase/supabase.dart';

import '../../../integration/supabase/supabase_integration.dart';
import '../upload/upload_image.dart';

Future<void> uploadLogoProject(
    {required String projectId, required List<int> logo}) async {
  try {
    if (logo.isEmpty) {
      throw FormatException("Error with Upload empty Logo project");
    }

    final url = await uploadImage(
        bucket: 'logo',
        folder: null,
        projectId: "$projectId-logo",
        imageBinary: Uint8List.fromList(logo));
    await SupabaseIntegration.supabase!
        .from("projects")
        .update({'logo_url': url})
        .eq('project_id', projectId)
        .select();
  } on StorageException catch (_) {
    throw StorageException("The size of logo image should be less than 225 KB");
  } catch (error) {
    throw FormatException(error.toString());
  }
}

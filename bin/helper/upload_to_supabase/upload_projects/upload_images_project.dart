import 'dart:typed_data';

import 'package:supabase/supabase.dart';

import '../../../integration/supabase/supabase_integration.dart';
import '../upload/upload_image.dart';

Future<void> uploadImagesProject(
    {required String projectId, required List<List<int>> images}) async {
  try {
    if (images.isEmpty) {
      throw FormatException("Error with Upload empty list images project");
    }
    for (var element in images) {
      if (element.isEmpty) {
        throw FormatException("Error with Upload empty image project");
      }
    }

    final futures = images.asMap().entries.map((entry) {
      final count = entry.key + 1;
      final image = entry.value;
      return uploadImage(
              bucket: 'project_images',
              folder: null,
              projectId: "$projectId-$count",
              imageBinary: Uint8List.fromList(image))
          .then((url) async {
        return SupabaseIntegration.supabase!.from("images_project").upsert(
            {"id": count, 'url': url, "project_id": projectId}).select();
      });
    }).toList();

    await Future.wait(futures);
  } on StorageException catch (_) {
    throw StorageException(
        "The size of pre image project should be less than 250 KB");
  } catch (error) {
    throw FormatException(error.toString());
  }
}

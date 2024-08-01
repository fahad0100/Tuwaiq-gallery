import 'dart:typed_data';

import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

import '../../../integration/supabase/supabase_integration.dart';

Future<String> uploadImage({
  required String bucket,
  required String folder,
  required Uint8List imageBinary,
  required String projectId,
}) async {
  try {
    var uuid = Uuid();
    var id = uuid.v4();

    final list = await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .list(path: folder, searchOptions: SearchOptions(limit: 100000000));

    final deleteFutures = list
        .where((element) => element.name.startsWith(projectId))
        .map((element) {
      return SupabaseIntegration.supabase!.storage
          .from(bucket)
          .remove(["$folder/${element.name}"]);
    }).toList();

    await Future.wait(deleteFutures);

    await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .uploadBinary('$folder/$projectId-$id.png', imageBinary);

    final result = SupabaseIntegration.supabase!.storage
        .from(bucket)
        .getPublicUrl('$folder/$projectId-$id.png');
    return result;
  } catch (error) {
    throw FormatException("Error with init upload image");
  }
}

//---------------------------------

Future<String> uploadImageProfile({
  required String bucket,
  required String folder,
  required Uint8List imageBinary,
  required String userID,
}) async {
  try {
    final String time = DateTime.now().toString();
    final list = await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .list(path: folder, searchOptions: SearchOptions(limit: 100000000));

    final deleteFutures =
        list.where((element) => element.name.startsWith(userID)).map((element) {
      return SupabaseIntegration.supabase!.storage
          .from(bucket)
          .remove(["$folder/${element.name}"]);
    }).toList();

    await Future.wait(deleteFutures);

    final String name = '$folder/$userID-$time.png';

    await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .uploadBinary(name, imageBinary);

    final result =
        SupabaseIntegration.supabase!.storage.from(bucket).getPublicUrl(name);
    return result;
  } catch (error) {
    throw FormatException("Error with init upload image");
  }
}

//---------------------------------

Future<String> uploadCVProfile({
  required String bucket,
  required String folder,
  required Uint8List cvBinary,
  required String userID,
}) async {
  try {
    final String time = DateTime.now().toString();
    final list = await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .list(path: folder, searchOptions: SearchOptions(limit: 100000000));

    final deleteFutures =
        list.where((element) => element.name.startsWith(userID)).map((element) {
      return SupabaseIntegration.supabase!.storage
          .from(bucket)
          .remove(["$folder/${element.name}"]);
    }).toList();

    await Future.wait(deleteFutures);

    final String name = '$folder/$userID-$time-cv.pdf';

    await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .uploadBinary(name, cvBinary);

    final result =
        SupabaseIntegration.supabase!.storage.from(bucket).getPublicUrl(name);
    return result;
  } catch (error) {
    throw FormatException("Error with init upload CV");
  }
}

Future<void> forDeleteAllFileProjects({required String id}) async {
  try {
    final listBucket = ["projects_pdf", "project_images", "projects_logo"];

    // قم بتخزين جميع Future في قائمة وانتظارهم مرة واحدة في النهاية
    final List<Future> deleteOperations = [];

    for (var element in listBucket) {
      final list = await SupabaseIntegration.supabase!.storage
          .from("projects")
          .list(path: element, searchOptions: SearchOptions(limit: 100000000));

      for (var imagesGet in list) {
        if (imagesGet.name.startsWith(id)) {
          print(imagesGet.name);
          deleteOperations.add(SupabaseIntegration.supabase!.storage
              .from('projects')
              .remove(["$element/${imagesGet.name}"]));
        }
      }
    }

    // انتظار جميع العمليات لتنفيذها مرة واحدة
    await Future.wait(deleteOperations);
  } catch (error) {
    throw FormatException("There error with delete file for project");
  }
}

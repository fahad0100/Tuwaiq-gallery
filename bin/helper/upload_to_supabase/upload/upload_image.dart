import 'dart:typed_data';

import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

import '../../../integration/supabase/supabase_integration.dart';

Future<String> uploadImage({
  required String bucket,
  String? folder,
  required Uint8List imageBinary,
  required String projectId,
}) async {
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
        .remove(["${folder == null ? "" : "$folder/"}${element.name}"]);
  }).toList();

  await Future.wait(deleteFutures);
  final pathName = '${folder == null ? "" : "$folder/"}$projectId-$id.png';
  await SupabaseIntegration.supabase!.storage
      .from(bucket)
      .uploadBinary(pathName, imageBinary);

  final result =
      SupabaseIntegration.supabase!.storage.from(bucket).getPublicUrl(pathName);
  return result;
}

//---------------------------------

Future<String> uploadImageProfile({
  required String bucket,
  String? folder,
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
          .remove(["${folder == null ? "" : "$folder/"}${element.name}"]);
    }).toList();

    await Future.wait(deleteFutures);

    final String name = '${folder == null ? "" : "$folder/"}$userID-$time.png';

    await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .uploadBinary(name, imageBinary);

    final result =
        SupabaseIntegration.supabase!.storage.from(bucket).getPublicUrl(name);
    return result;
  } on StorageException catch (_) {
    throw StorageException(
        "The size of image profile should be less than 500 KB");
  } catch (error) {
    throw FormatException(error.toString());
  }
}

//---------------------------------

Future<String> uploadCVProfile({
  required String bucket,
  String? folder,
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
          .remove(["${folder == null ? "" : "$folder/"}${element.name}"]);
    }).toList();

    await Future.wait(deleteFutures);

    final String name =
        '${folder == null ? "" : "$folder/"}$userID-$time-cv.pdf';

    await SupabaseIntegration.supabase!.storage
        .from(bucket)
        .uploadBinary(name, cvBinary);

    final result =
        SupabaseIntegration.supabase!.storage.from(bucket).getPublicUrl(name);
    return result;
  } on StorageException catch (_) {
    throw StorageException("The size of CV should be less than 1 MB");
  } catch (error) {
    throw FormatException(error.toString());
  }
}

Future<void> forDeleteAllFileProjects({required String id}) async {
  try {
    final listBucket = ["presentation", "logo", "project_images"];

    final List<Future> deleteOperations = [];

    for (var element in listBucket) {
      final list = await SupabaseIntegration.supabase!.storage
          .from(element)
          .list(path: null, searchOptions: SearchOptions(limit: 100000000));

      for (var imagesGet in list) {
        if (imagesGet.name.startsWith(id)) {
          deleteOperations.add(SupabaseIntegration.supabase!.storage
              .from(element)
              .remove([(imagesGet.name)]));
        }
      }
    }

    await Future.wait(deleteOperations);
  } catch (error) {
    throw FormatException("There error with delete file for project");
  }
}

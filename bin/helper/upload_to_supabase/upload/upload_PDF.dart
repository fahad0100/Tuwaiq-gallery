import 'dart:typed_data';

import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

import '../../../integration/supabase/supabase_integration.dart';

Future<String> uploadPDF({
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

  await SupabaseIntegration.supabase!.storage.from(bucket).uploadBinary(
      '${folder == null ? "" : "$folder/"}$projectId-$id.pdf', imageBinary);

  final result = SupabaseIntegration.supabase!.storage
      .from(bucket)
      .getPublicUrl('${folder == null ? "" : "$folder/"}$projectId-$id.pdf');
  return result;
}

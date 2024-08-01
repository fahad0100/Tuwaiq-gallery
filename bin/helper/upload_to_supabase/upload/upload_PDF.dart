import 'dart:typed_data';

import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

import '../../../integration/supabase/supabase_integration.dart';

Future<String> uploadPDF({
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
        .uploadBinary('$folder/$projectId-$id.pdf', imageBinary);

    final result = SupabaseIntegration.supabase!.storage
        .from(bucket)
        .getPublicUrl('$folder/$projectId-$id.pdf');
    return result;
  } catch (error) {
    throw FormatException("Error with init upload pdf");
  }
}

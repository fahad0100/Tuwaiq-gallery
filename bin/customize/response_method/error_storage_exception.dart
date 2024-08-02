import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../response.dart';

Response errorStorageException({required StorageException error}) {
  String message = '';
  switch (error.message) {
    case 'The object exceeded the maximum allowed size':
      message = 'File not allow size';
      break;

    default:
      message = error.message;
  }
  return ResponseClass().errorResponse(message: "Error", data: message);
}

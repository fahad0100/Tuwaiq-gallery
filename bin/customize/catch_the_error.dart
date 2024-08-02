import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import 'exception.dart';
import 'response.dart';
import 'response_method/error_auth_exception.dart';
import 'response_method/error_format_exception.dart';
import 'response_method/error_not_found_exception.dart';
import 'response_method/error_postgrest_exception.dart';
import 'response_method/error_storage_exception.dart';

class CatchTheError {
  final dynamic error;

  CatchTheError({required this.error}) {
    print('\x1B[31m$error\x1B[0m');
  }

  Response errorMessage() {
    print("Error: $error");
    if (error is FormatException) {
      return errorFormatException(error: error);
    } else if (error is AuthException) {
      return errorAuthException(error: error);
    } else if (error is PostgrestException) {
      return errorPostgrestException(error: error);
    } else if (error is StorageException) {
      return errorStorageException(error: error);
    } else if (error is NotFoundException) {
      return errorNotFoundException(error: error);
    } else {
      return ResponseClass()
          .errorResponse(message: "ErrorEnd", data: error.toString());
    }
  }
}

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../response.dart';

Response errorPostgrestException({required PostgrestException error}) {
  String message = '';
  switch (error.message) {
    case 'A user with this email address has already been registered':
      message = 'Email address has already use';
      break;
    case 'Token has expired or is invalid':
      message = 'Token has expired or is out time';
      break;
    default:
      message = error.message;
  }
  return ResponseClass().errorResponse(message: "Error", data: message);
}

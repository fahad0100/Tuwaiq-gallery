import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../response.dart';

Response errorAuthException({required AuthException error}) {
  String message = '';
  switch (error.message) {
    case 'A user with this email address has already been registered':
      message = 'Email address has already use';
      break;
    case 'Token has expired or is invalid':
      message = 'OTP has expired or is out time';
      break;
    case 'Signups not allowed for otp':
      message = 'Create account first to allow Login in';
      break;

    default:
      message = error.message;
  }
  return ResponseClass().errorResponse(message: "Error", data: message);
}

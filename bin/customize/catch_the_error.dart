import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import 'exception.dart';
import 'response.dart';

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
    } else if (error is NotFoundException) {
      return errorNotFoundException(error: error);
    } else {
      return ResponseClass()
          .errorResponse(message: "ErrorEnd", data: error.toString());
    }
  }
}

Response errorFormatException({required FormatException error}) {
  return ResponseClass()
      .errorResponse(message: "Error", data: error.message.toString());
}

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

Response errorNotFoundException({required NotFoundException error}) {
  String message = '';
  switch (error.message) {
    default:
      message = error.message;
  }
  return ResponseClass()
      .errorResponse(message: "Error", data: message, code: 404);
}

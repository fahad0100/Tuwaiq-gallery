import 'package:shelf/shelf.dart';

import '../exception.dart';
import '../response.dart';

Response errorNotFoundException({required NotFoundException error}) {
  String message = '';
  switch (error.message) {
    default:
      message = error.message;
  }
  return ResponseClass()
      .errorResponse(message: "Error", data: message, code: 404);
}

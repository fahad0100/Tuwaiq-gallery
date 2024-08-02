import 'package:shelf/shelf.dart';

import '../response.dart';

Response errorFormatException({required FormatException error}) {
  return ResponseClass()
      .errorResponse(message: "Error", data: error.message.toString());
}

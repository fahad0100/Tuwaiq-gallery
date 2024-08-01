import 'package:shelf/shelf.dart';

import '../customize/response.dart';
import '../helper/token.dart';

Middleware supervisorMiddleware = (Handler innerHandler) {
  return (Request request) async {
    try {
      final token = request.headers['Authorization'] ?? '';
      if (token.trim().isEmpty) {
        throw FormatException("You don't have permission.");
      }
      final user = await getTokenFromHeader(req: request);

      if (user.idDataBase.isEmpty) {
        throw FormatException("You don't have permission.");
      }
      if (user.roleUser != "supervisor" && user.roleUser != "admin") {
        throw FormatException("You don't have permission.");
      }
      return innerHandler(request);
    } catch (error) {
      return CatchTheError(error: error).errorMessage();
    }
  };
};

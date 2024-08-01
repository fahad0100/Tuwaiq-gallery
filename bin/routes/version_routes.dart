import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../customize/response.dart';
import 'main_routes.dart';

class VersionRoute {
  Handler get route {
    final router = Router()
      ..get('/', (Request req) {
        return Response.ok("server is raining");
      })
      ..mount('/v1', MainRoute().route.call)
      ..all('/<anything|.*>', (Request req) {
        // return Response.notFound(
        //     "The endpoint you are try to access is not found");

        return ResponseClass().errorResponse(
            message: "Not found",
            data: "The endpoint you are try to access is not found",
            code: 404);
      });

    return router.call;
  }
}

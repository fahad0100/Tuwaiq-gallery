import 'dart:convert';

import 'package:shelf/shelf.dart';
export './catch_the_error.dart';

class ResponseClass {
  final header = {'Content-Type': 'application/json'};
  succeedResponse({String? message, dynamic data}) {
    return Response.ok(json.encode({"msg": message, "data": data}),
        headers: header);
  }

  Response errorResponse({String? message, dynamic data, int? code = 400}) {
    switch (code) {
      case 400:
        return Response.badRequest(
            body: json.encode({"msg": message, "data": data}), headers: header);
      case 403:
        return Response.forbidden(json.encode({"msg": message, "data": data}),
            headers: header);
      case 500:
        return Response.internalServerError(
            body: json.encode({"msg": message, "data": data}), headers: header);
      case 404:
        return Response.notFound(json.encode({"msg": message, "data": data}),
            headers: header);
      case 303:
        return Response.seeOther(json.encode({"msg": message, "data": data}),
            headers: header);
      case 401:
        return Response.unauthorized(
            json.encode({"msg": message, "data": data}),
            headers: header);

      default:
        return Response.badRequest(
            body: json.encode({"msg": message, "data": data}), headers: header);
    }
  }
}

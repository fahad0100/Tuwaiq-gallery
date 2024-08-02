// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:content_length_validator/content_length_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_helmet/shelf_helmet.dart';
import 'package:shelf_rate_limiter/shelf_rate_limiter.dart';
import 'integration/supabase/supabase_integration.dart';
import 'routes/version_routes.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

void main(List<String> args) async {
  // withHotreload(
  //   () => createServer(),
  //   onReloaded: () => print('Reload!'),
  //   onHotReloadNotAvailable: () => print('No hot-reload :('),
  //   onHotReloadAvailable: () => print('Yay! Hot-reload :)'),
  //   onHotReloadLog: (log) => print('Reload Log: ${log.message}'),
  //   logLevel: Level.INFO,
  // );
  await createServer();
}

FutureOr<HttpServer> createServer() async {
  await SupabaseIntegration().supabaseInit();

  final ip = InternetAddress.anyIPv4;
  const int maxContentLength = 7 * 1024 * 1024;
  print(maxContentLength);

  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_ORIGIN: 'https://tuwaiq-gallery.onrender.com',
    'Content-Type': 'application/json;charset=utf-8',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
  };

  final memoryStorage = MemStorage();
  final rateLimiter = ShelfRateLimiter(
      storage: memoryStorage, duration: Duration(seconds: 60), maxRequests: 10);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(logRequestSizeMiddleware())
      .addMiddleware(rateLimiter.rateLimiter())
      .addMiddleware(
          maxContentLengthValidator(maxContentLength: maxContentLength))
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addMiddleware(_securityHeadersMiddleware())
      .addMiddleware(helmet())
      .addHandler(VersionRoute().route.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  server.autoCompress = true;

  print(
      'Server listening on port http://${server.address.host}:${server.port}');

  return server;
}

Middleware _securityHeadersMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      final response = await innerHandler(request);
      return response.change(headers: {
        'X-Frame-Options': 'DENY',
        'X-XSS-Protection': '1; mode=block',
        'X-Content-Type-Options': 'nosniff',
        'Strict-Transport-Security':
            'max-age=63072000; includeSubDomains; preload',
        'Referrer-Policy': 'no-referrer',
        'X-DNS-Prefetch-Control': 'off',
        'Feature-Policy': "geolocation 'self'; vibrate 'none'",
        'Permissions-Policy': "geolocation=(self), vibrate=()",
        'Content-Security-Policy':
            "default-src 'self'; script-src 'self'; object-src 'none';",
        'Cross-Origin-Opener-Policy': 'same-origin',
        'Cross-Origin-Resource-Policy': 'same-origin',
        'X-Powered-By': "self"
      });
    };
  };
}

//?

Middleware logRequestSizeMiddleware() {
  return (Handler handler) {
    return (Request request) async {
      var requestSize = 0;

      // If the request has a content length, use it
      if (request.contentLength != null) {
        requestSize = request.contentLength!;
      } else {
        // If there's no content length, read the body to determine the size
        final body = await request.readAsString();
        requestSize = utf8.encode(body).length;
      }

      final requestSizeInMB = requestSize / (1024 * 1024);
      print('Request size: ${requestSizeInMB.toStringAsFixed(2)} MB');

      return handler(request);
    };
  };
}

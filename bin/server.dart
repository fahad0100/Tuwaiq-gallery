// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:io';
import 'package:content_length_validator/content_length_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_helmet/shelf_helmet.dart';
import 'package:shelf_rate_limiter/shelf_rate_limiter.dart';
import 'helper/upload_to_supabase/upload/upload_image.dart';
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
  const int maxContentLength = 4 * 1024 * 1024;
  await forDeleteAllFileProjects(id: 'p-R95P0ETPMY');
  maxContentLengthValidator(
    maxContentLength: maxContentLength,
  );
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
      .addMiddleware(rateLimiter.rateLimiter())
      .addMiddleware(
          maxContentLengthValidator(maxContentLength: maxContentLength))
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addMiddleware(helmet())
      .addMiddleware(contentSecurityPolicy())
      .addMiddleware(crossOriginOpenerPolicy())
      .addMiddleware(crossOriginResourcePolicy())
      .addMiddleware(originAgentCluster())
      .addMiddleware(referrerPolicy())
      .addMiddleware(strictTransportSecurity())
      .addMiddleware(xContentTypeOptions())
      .addMiddleware(xDnsPrefetchControl())
      .addMiddleware(xDownloadOptions())
      .addMiddleware(xFrameOptions())
      .addMiddleware(xPermittedCrossDomainPolicies())
      .addMiddleware(xXssProtection())
      .addHandler(VersionRoute().route.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  server.autoCompress = true;

  print(
      'Server listening on port http://${server.address.host}:${server.port}');

  return server;
}

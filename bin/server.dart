// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
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

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(VersionRoute().route.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print(
      'Server listening on port http://${server.address.host}:${server.port}');

  return server;
}

sendImage() {}

final x = {
  "msg": "success",
  "data": {
    "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
    "first_name": "mohammed",
    "last_name": "alazmio",
    "email": "xalap95777@orsbap.com",
    "role": "supervisor",
    "image_url":
        "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
    "resume_url":
        "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
    "link": {
      "github": "https://github.com/fahad0100",
      "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
      "resume": "https://github.com/fahad0100",
      "bindlink": "https://github.com/fahad0100"
    },
    "projects": [
      {
        "project_id": "p-7IKLodojYY",
        "type": "website",
        "project_name": "Amazing Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description":
            "An amazing Flutter app that revolutionizes user experience.",
        "logo_url":
            "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-7IKLodojYY-logo-5914b0be-1fcd-45b3-9217-008e8dc4317e.png",
        "presentation_url":
            "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-7IKLodojYY-p-a18daefb-0276-4ff2-a6d3-45000d4863af.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-07-31T12:56:20.692437",
        "update_at": "2024-07-31T17:43:28.226911",
        "images_project": [
          {
            "id": 1,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-1-493232b8-ef65-4106-873c-888451e28a05.png"
          },
          {
            "id": 2,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-2-fee38f00-bf90-48e0-8762-8290b2220947.png"
          },
          {
            "id": 3,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-7IKLodojYY-3-7d06d21f-9fff-4628-8f43-27bd54289300.png"
          }
        ],
        "links_project": [
          {"url": "https://github.com/example", "type": "github"},
          {"url": "https://figma.com/example", "type": "figma"},
          {"url": "https://youtube.com/example", "type": "video"},
          {"url": "https://appstore.com/example", "type": "pinterest"},
          {"url": "https://appstore.com/example", "type": "playstore"},
          {"url": "https://appstore.com/example", "type": "applestore"},
          {"url": "https://appstore.com/example", "type": "apk"},
          {"url": null, "type": "weblink"}
        ],
        "members_project": [
          {
            "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
            "first_name": "mohammed",
            "last_name": "alazmio",
            "email": "hehovik255@maxturns.com",
            "position": "ui",
            "image_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.510764.png",
            "resume_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.511639-cv.pdf",
            "user_account": {
              "github": "https://github.com/fahad0100",
              "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
              "resume": "https://github.com/fahad0100",
              "bindlink": "https://github.com/fahad0100"
            }
          },
          {
            "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
            "first_name": "mohammed",
            "last_name": "alazmio",
            "email": "xalap95777@orsbap.com",
            "position": "Developer",
            "image_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
            "resume_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
            "user_account": {
              "github": "https://github.com/fahad0100",
              "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
              "resume": "https://github.com/fahad0100",
              "bindlink": "https://github.com/fahad0100"
            }
          },
          {
            "id": "a81adc35-426e-4201-a62e-651085e3e512",
            "first_name": "fahad",
            "last_name": "alazmi",
            "email": "vokoka2166@orsbap.com",
            "position": "Developer",
            "image_url": null,
            "resume_url": null,
            "user_account": {}
          }
        ]
      },
      {
        "project_id": "p-Ge8oNRPiG7",
        "type": "app",
        "project_name": "Flutter App",
        "bootcamp_name": "Flutter Bootcamp 2024",
        "start_date": "2024-12-15",
        "end_date": "2024-12-15",
        "presentation_date": "2024-12-15",
        "project_description":
            "An amazing Flutter app that revolutionizes user experience.",
        "logo_url":
            "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects_logo/p-Ge8oNRPiG7-logo-305652de-535d-44d5-b73f-5f8793d0dcfc.png",
        "presentation_url":
            "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/projects.pdf/p-Ge8oNRPiG7-p-c5611490-0f79-428e-88f1-1ba77620d8b9.pdf",
        "user_id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
        "admin_id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
        "time_end_edit": "2024-12-11",
        "allow_edit": true,
        "is_public": true,
        "create_at": "2024-07-31T12:43:57.968599",
        "update_at": "2024-07-31T17:51:12.961115",
        "images_project": [
          {
            "id": 3,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-3-a5ddc0bc-05b7-45e9-8c5c-909df475c22f.png"
          },
          {
            "id": 2,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-2-b241287c-9fc5-4ea8-b276-ab90553aa805.png"
          },
          {
            "id": 1,
            "url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/images/project_images/p-Ge8oNRPiG7-1-70b20221-1e82-403e-b486-b3fa5663ce96.png"
          }
        ],
        "links_project": [
          {"url": "https://github.com/example", "type": "github"},
          {"url": "https://figma.com/example", "type": "figma"},
          {"url": "https://youtube.com/example", "type": "video"},
          {"url": "https://appstore.com/example", "type": "pinterest"},
          {"url": "https://appstore.com/example", "type": "playstore"},
          {"url": "https://appstore.com/example", "type": "applestore"},
          {"url": "https://appstore.com/example", "type": "apk"},
          {"url": null, "type": "weblink"}
        ],
        "members_project": [
          {
            "id": "80eb1743-a679-47de-a8c4-366b2bd5a96c",
            "first_name": "mohammed",
            "last_name": "alazmio",
            "email": "hehovik255@maxturns.com",
            "position": "ui",
            "image_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.510764.png",
            "resume_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/80eb1743-a679-47de-a8c4-366b2bd5a96c-2024-07-31%2016:33:45.511639-cv.pdf",
            "user_account": {
              "github": "https://github.com/fahad0100",
              "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
              "resume": "https://github.com/fahad0100",
              "bindlink": "https://github.com/fahad0100"
            }
          },
          {
            "id": "0a164eaf-8f34-4fea-9a00-443f1eb05bd9",
            "first_name": "mohammed",
            "last_name": "alazmio",
            "email": "xalap95777@orsbap.com",
            "position": "Developer",
            "image_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/users/images/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.218298.png",
            "resume_url":
                "https://cgeahwvmrqwnlsjpfexu.supabase.co/storage/v1/object/public/resume/cv/0a164eaf-8f34-4fea-9a00-443f1eb05bd9-2024-07-31%2014:25:54.222366-cv.pdf",
            "user_account": {
              "github": "https://github.com/fahad0100",
              "linkedin": "https://www.linkedin.com/in/fahad-alazmi/",
              "resume": "https://github.com/fahad0100",
              "bindlink": "https://github.com/fahad0100"
            }
          },
          {
            "id": "a81adc35-426e-4201-a62e-651085e3e512",
            "first_name": "fahad",
            "last_name": "alazmi",
            "email": "vokoka2166@orsbap.com",
            "position": "Developer",
            "image_url": null,
            "resume_url": null,
            "user_account": {}
          }
        ]
      }
    ],
    "created_at": "2024-07-26T21:10:06.159437+00:00",
    "updated_at": "2024-07-26T21:10:06.159437+00:00"
  }
};

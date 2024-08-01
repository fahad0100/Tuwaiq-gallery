// import 'dart:typed_data';

// import '../../../integration/supabase/supabase_integration.dart';
// import '../../../models/project_model.dart';
// import '../upload/upload_PDF.dart';

// Future<void> uploadCVMembersProject(
//     {required String projectId, required List<Members> members}) async {
//   try {
//     final futures = members.asMap().entries.map((entry) {
//       final count = entry.key + 1;
//       final member = entry.value;
//       return uploadPDF(
//               bucket: 'images',
//               folder: 'resume_pdf',
//               projectId: "$projectId-$count",
//               imageBinary: Uint8List.fromList(member.resume))
//           .then((url) {
//         return SupabaseIntegration.supabase!
//             .from("members_project")
//             .upsert({
//               "id": count,
//               "project_id": projectId,
//               ...member.toJson(),
//               "cv_url": url
//             })
//             .eq('project_id', projectId)
//             .select();
//       });
//     }).toList();

//     await Future.wait(futures);
//   } catch (error) {
//     throw FormatException("Error with Upload resume pdf project");
//   }
// }



// /*

//     return uploadPDF(
//               bucket: 'images',
//               folder: 'resume_pdf',
//               projectId: "$projectId-$count",
//               imageBinary: Uint8List.fromList(member.resume))
//           .then((url) {
//         return SupabaseIntegration.supabase!
//             .from("members_project")
//             .upsert({
//               "id": count,
//               "project_id": projectId,
//               ...member.toJson(),
//               "cv_url": url
//             })
//             .eq('project_id', projectId)
//             .select();
//       });
//     }).toList();

// */
import 'dart:convert';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../helper/upload_to_supabase/upload/upload_image.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/update_profile.dart';
import '../../models/users/user_deltals.dart';

updateProfileUserHandler(Request req) async {
  try {
    final bodyJson = json.decode(await req.readAsString());
    final body = UpdateProfileModel.fromJson(bodyJson);
    final user = await getTokenFromHeader(req: req);

    final List<Future> tasks = [];

    if (body.accounts != null) {
      tasks.add(SupabaseIntegration.supabase!
          .from('user_account')
          .upsert({
            ...body.toJsonAccountUpdate()["accounts"],
            "user_id": user.idDataBase
          })
          .eq("user_id", user.idDataBase)
          .select()
          .single());
    }

    if (body.imageDataBinary != null) {
      tasks.add(uploadImageProfile(
              bucket: 'users',
              folder: 'images',
              userID: user.idDataBase,
              imageBinary: Uint8List.fromList(body.imageDataBinary!))
          .then((url) {
        body.imageURL = url;
      }));
    }

    if (body.resumeDataBinary != null) {
      tasks.add(uploadCVProfile(
              bucket: 'resume',
              folder: 'cv',
              userID: user.idDataBase,
              cvBinary: Uint8List.fromList(body.resumeDataBinary!))
          .then((url) {
        body.resumeURL = url;
      }));
    }

    await Future.wait(tasks);

    await SupabaseIntegration.supabase
        ?.from('users')
        .update(body.toJsonBasicUpdate())
        .eq("id", user.idDataBase)
        .select()
        .single();

    if (user.roleUser != "user") {
      final userProfile =
          await getProfileSupervisorDataBase(id: user.idDataBase);

      return ResponseClass()
          .succeedResponse(message: "success", data: userProfile.toJson());
    } else {}
    final userProfile = await getProfileUserDataBase(id: user.idDataBase);

    return ResponseClass()
        .succeedResponse(message: "success", data: userProfile.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

Future<UserDetails> getProfileUserDataBase({required String id}) async {
  try {
    final userProfile = await SupabaseIntegration.supabase
        ?.from('users')
        .select("*,user_account(*)")
        .eq("id", id)
        .single();

    final project = await SupabaseIntegration.supabase
        ?.from('projects')
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("user_id", id);
    userProfile!["projects"] = project;

    return UserDetails.fromJson(userProfile);
  } catch (error) {
    throw FormatException(error.toString());
  }
}

Future<UserDetails> getProfileSupervisorDataBase({required String id}) async {
  try {
    final userProfile = await SupabaseIntegration.supabase
        ?.from('users')
        .select("*,user_account(*)")
        .eq("id", id)
        .single();

    final project = await SupabaseIntegration.supabase
        ?.from('projects')
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .eq("admin_id", id);
    userProfile!["projects"] = project;

    return UserDetails.fromJson(userProfile);
  } catch (error) {
    throw FormatException(error.toString());
  }
}

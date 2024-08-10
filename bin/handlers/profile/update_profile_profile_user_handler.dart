import 'dart:convert';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/get_data_supabase/profile/get_profile_user_database.dart';
import '../../helper/token.dart';
import '../../helper/upload_to_supabase/upload/upload_image.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/users/update_profile.dart';

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
              folder: null,
              userID: user.idDataBase,
              imageBinary: Uint8List.fromList(body.imageDataBinary!))
          .then((url) {
        body.imageURL = url;
      }));
    }

    if (body.resumeDataBinary != null) {
      tasks.add(uploadCVProfile(
              bucket: 'resume',
              folder: null,
              userID: user.idDataBase,
              cvBinary: Uint8List.fromList(body.resumeDataBinary!))
          .then((url) {
        body.resumeURL = url;
      }));
    }

    await Future.wait(tasks);
    if (body.resumeURL != null) {
      await SupabaseIntegration.supabase!
          .from('user_account')
          .upsert({"resume": body.resumeURL, "user_id": user.idDataBase})
          .eq("user_id", user.idDataBase)
          .select();
    }

    await SupabaseIntegration.supabase
        ?.from('users')
        .update(body.toJsonBasicUpdate())
        .eq("id", user.idDataBase)
        .select()
        .single();

    final userProfile = await getProfileUserDataBase(id: user.idDataBase);

    return ResponseClass()
        .succeedResponse(message: "success", data: userProfile.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

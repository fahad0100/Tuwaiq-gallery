import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/get_data_supabase/profile/get_profile_user_database.dart';
import '../../helper/token.dart';
import '../../models/users/user_details.dart';

profileUserHandler(Request req) async {
  try {
    final user = await getTokenFromHeader(req: req);

    UserDetails userProfile = await getProfileUserDataBase(id: user.idDataBase);

    return ResponseClass()
        .succeedResponse(message: "success", data: userProfile.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

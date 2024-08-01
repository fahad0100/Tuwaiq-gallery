import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../models/users/user_deltals.dart';
import 'update_profile_profile_user_handler.dart';

profileUserHandler(Request req) async {
  try {
    final user = await getTokenFromHeader(req: req);
    if (user.roleUser == "supervisor" || user.roleUser == "admin") {
      final userProfile =
          await getProfileSupervisorDataBase(id: user.idDataBase);

      return ResponseClass()
          .succeedResponse(message: "success", data: userProfile);
    }
    UserDetails userProfile = await getProfileUserDataBase(id: user.idDataBase);

    return ResponseClass()
        .succeedResponse(message: "success", data: userProfile.toJson());
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

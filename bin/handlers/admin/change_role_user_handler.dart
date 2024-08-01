import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../customize/response.dart';
import '../../helper/token.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/admin/role_model.dart';

Future changeRoleUserAdminHandler(Request req) async {
  try {
    // Decode request body once
    final requestBody = json.decode(await req.readAsString());
    final body = RoleModel.fromJsonChangeRoleUser(requestBody);

    // Check user role
    final userToken = await getTokenFromHeader(req: req);
    if (userToken.roleUser.trim() != "admin") {
      throw FormatException("You don't have the permissions");
    }

    // Perform database operations
    final supabase = SupabaseIntegration.supabase!;
    final userProfileFuture = supabase
        .from('users')
        .update({'role': body.role!.name})
        .eq('id', body.idUser!)
        .select("*")
        .single();

    // Use async/await to get both userProfile and userUpdated
    final userProfile = await userProfileFuture;
    final userUpdatedFuture =
        supabase.auth.admin.getUserById(userProfile["auth_id"]);

    // Update user profile
    final userUpdated = await userUpdatedFuture;
    await supabase.auth.admin.updateUserById(userUpdated.user!.id,
        attributes:
            AdminUserAttributes(userMetadata: {"role": body.role!.name}));

    return ResponseClass().succeedResponse(
        message: "success",
        data: {"id": body.idUser, "new_role": body.role!.name});
  } catch (error) {
    // Handle errors and log if needed
    return CatchTheError(error: error).errorMessage();
  }
}

import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/auth_model.dart';
import 'package:supabase/supabase.dart';

createAccountUserHandler(Request req) async {
  try {
    final body =
        AuthModel.fromJsonCreate(json.decode(await req.readAsString()));

    final userCreate = await SupabaseIntegration.supabase?.auth.admin
        .createUser(AdminUserAttributes(email: body.email));
    await SupabaseIntegration.supabase
        ?.from("users")
        .insert({...body.toJsonCreate(), "auth_id": userCreate?.user?.id});
    await SupabaseIntegration.supabase?.auth
        .signInWithOtp(email: body.email, shouldCreateUser: false);
    return ResponseClass()
        .succeedResponse(message: "success", data: {"email": body.email});
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../customize/response.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/auth_model.dart';

loginAccountUserHandler(Request req) async {
  try {
    final body = AuthModel.fromJsonLogin(json.decode(await req.readAsString()));
    await SupabaseIntegration.supabase?.auth
        .signInWithOtp(email: body.email, shouldCreateUser: false);
    return ResponseClass()
        .succeedResponse(message: "success", data: {"email": body.email});
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

import 'dart:convert';

import 'package:shelf/shelf.dart';
import '../../customize/response.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/auth_model.dart';

resendNewCodeHandler(Request req) async {
  try {
    final body = AuthModel.fromJsonLogin(json.decode(await req.readAsString()));

    await SupabaseIntegration.supabase?.auth.signInWithOtp(email: body.email);

    return ResponseClass().succeedResponse(
        message: "success", data: "Resend new code to your email");
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

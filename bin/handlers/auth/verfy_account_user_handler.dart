import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../customize/response.dart';
import '../../helper/secures/encrypted_method.dart';
import '../../integration/supabase/supabase_integration.dart';
import '../../models/auth_model.dart';

verifyHandler(Request req) async {
  try {
    final body =
        AuthModel.fromJsonVerify(json.decode(await req.readAsString()));
    AuthResponse? user;
    user = await SupabaseIntegration.supabase?.auth
        .verifyOTP(type: OtpType.email, token: body.otp, email: body.email);
    final token = await encryptedMethod(text: user!.session!.accessToken);
    final refreshToken =
        await encryptedMethod(text: user.session!.refreshToken!);
    return ResponseClass().succeedResponse(message: "success", data: {
      "token": token,
      "refreshToken": refreshToken,
      "expiresAt": user.session!.expiresAt,
    });
  } catch (error) {
    return CatchTheError(error: error).errorMessage();
  }
}

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../models/token_model.dart';
import 'secures/decrypted_method.dart';

Future<TokenModel> getTokenFromHeader({required Request req}) async {
  try {
    String? authorizationHeader = req.headers['Authorization']
        .toString()
        .trim()
        .substring('Bearer '.length);

    final user = await _getDataToken(token: authorizationHeader);

    return user;
  } catch (error) {
    rethrow;
  }
}

Future<TokenModel> _getDataToken({required String token}) async {
  try {
    final originToken = await decryptedMethod(encryptedText: token);

    final tokenData = JwtDecoder.decode(originToken);

    return TokenModel.fromJson(tokenData);
  } catch (_) {
    throw AuthException(
        'You are not authorized. Please verify your credentials');
  }
}

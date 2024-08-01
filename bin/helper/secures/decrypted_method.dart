import 'dart:convert';

import 'package:aes256gcm/aes256gcm.dart';
import 'package:dotenv/dotenv.dart';

Future<String> decryptedMethod({required String encryptedText}) async {
  try {
    final env = DotEnv(includePlatformEnvironment: true)..load();

    List<int> decodedBytes = base64Decode(encryptedText.trim());
    String decodedString = utf8.decode(decodedBytes);
    var decrypted = await Aes256Gcm.decrypt(
        decodedString.trim(), env['password'].toString());

    return decrypted;
  } catch (error) {
    throw FormatException("Invalid token. You don't have permission.");
  }
}

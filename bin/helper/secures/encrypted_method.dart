import 'dart:convert';

import 'package:aes256gcm/aes256gcm.dart';
import 'package:dotenv/dotenv.dart';

Future<String> encryptedMethod({required String text}) async {
  try {
    final env = DotEnv(includePlatformEnvironment: true)..load();

    var encrypted =
        await Aes256Gcm.encrypt(text.trim(), env['password'].toString());

    return base64Encode(encrypted.codeUnits);
  } catch (error) {
    throw FormatException("Sorry, encryption was not successfully created.");
  }
}

import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class PKCE {

  PKCE() {
    codeVerifier = _generateCodeVerifier();
    codeChallenge = _generateCodeChallenge(codeVerifier);
  }
  late String codeVerifier;
  late String codeChallenge;

  // Generate a code verifier (random string of 43-128 characters)
  String _generateCodeVerifier() {
    final Random random = Random.secure();
    const int length = 64; // Adjust length as needed
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

    return List.generate(length, (_) => chars[random.nextInt(chars.length)]).join();
  }

  // Generate a code challenge using SHA256
  String _generateCodeChallenge(String codeVerifier) {
    final List<int> bytes = utf8.encode(codeVerifier);
    final Digest digest = sha256.convert(bytes);
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }
}

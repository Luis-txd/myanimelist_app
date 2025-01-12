import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../resources/auth_configs.dart';
import '../../../utils/AppUtils.dart';
import '../../models/auth/auth_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});


class AuthNotifier extends StateNotifier<AuthState>{

  AuthNotifier(this.ref) : super(AuthState()) {
    _initializeAuthState();
  }

  final Ref ref;

  bool stateInitialized = false;
  final _storage = const FlutterSecureStorage();

  Future<void> _initializeAuthState() async {
    try {
      final isLogged = await _checkUserLogged();
      final accessToken = await _storage.read(key: 'accessToken');
      final refreshToken = await _storage.read(key: 'refreshToken');
      state = AuthState(
          isLogged: isLogged, accessToken: accessToken, refreshToken: refreshToken);
      stateInitialized = true;
      //_initializationCompleter.complete();
    } catch (e) {
      //_initializationCompleter.completeError(e);
    }
  }

  Future<bool> _checkUserLogged() async {
    final storedIdToken = await _storage.read(key: 'idToken');
    if (storedIdToken == null) {
      return false;
    }
    if (JwtDecoder.isExpired(storedIdToken)) {
      try {
        //await refresh();
        return true;
      } catch (e) {
        return false;
      }
    }
    return true;
  }
  Future<void> startAuthorizationFlow() async {
    if (state.isLoading) return;

    final codeVerifier = generateCodeVerifier();
    final codeChallenge = codeVerifier;
    final authUrl = Uri.https(
      'myanimelist.net',
      '/v1/oauth2/authorize',
      {
        'response_type': 'code',
        'client_id': AuthConfigs().clientId,
        'redirect_uri': AuthConfigs().redirectUri,
        'code_challenge': codeChallenge,
        'code_challenge_method': 'plain',
        'scopes': AuthConfigs().scopes,
      },
    );

    try {
      // Open the WebView for authentication
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: Uri.parse(AuthConfigs().redirectUri).scheme,
      );

      // Extract the authorization code from the redirect URL
      final code = Uri.parse(result).queryParameters['code'];
      if (code != null) {
        // Exchange the authorization code for an access token
        await exchangeCodeForToken(AuthConfigs().clientId, code, AuthConfigs().redirectUri, codeVerifier);
      }

    } catch (e, stacktrace) {
      print('ERROR: $e');
    }

  }

  Future<void> exchangeCodeForToken(String clientId, String code, String redirectUri, String codeVerifier) async {
    final tokenUrl = Uri.https('myanimelist.net', '/v1/oauth2/token');

    final response = await http.post(
      tokenUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': clientId,
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'code_verifier': codeVerifier,
      },
    );

    if (response.statusCode == 200) {
      processAuthTokenResponse(response);
    } else {
      print('Token exchange failed: ${response.body}');
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(
        isLogged: false,
        accessToken: '',
        refreshToken: '',
        expiresAt: '',
      );

      await _storage.deleteAll();
    } catch (error) {
      //ref.read(logoutErrorProvider.notifier).setError();
    }
  }

  Future<void> processAuthTokenResponse(http.Response response) async {
    final tokenData = jsonDecode(response.body);
    print('Access Token: ${tokenData['access_token']}');
    print('Refresh Token: ${tokenData['refresh_token']}');
    print('Expires In: ${tokenData['expires_in']}');

    final String accessToken = tokenData['access_token'] as String;
    final String refreshToken = tokenData['refresh_token'] as String;
    final String expiresAt = tokenData['expires_in'] as String;

    await _storage.write(key: 'accessToken', value: accessToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
    await _storage.write(key: 'expiresAt', value: expiresAt);

    state = state.copyWith(
      isLogged: true,
      accessToken: accessToken,
      refreshToken: refreshToken,
      isLoading: false,
      expiresAt: expiresAt,
    );
  }
}

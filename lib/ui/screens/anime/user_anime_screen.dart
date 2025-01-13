import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;

import '../../../data/providers/auth/auth_provider.dart';
import '../../../utils/AppUtils.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';
import '../../theme/app_text_theme.dart';

@RoutePage()
class AnimeScreen extends ConsumerStatefulWidget {
  const AnimeScreen({super.key});

  @override
  ConsumerState<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends ConsumerState<AnimeScreen> {
  // if not logged in, include a button to go to the login page?
  String? _accessToken;
  final String _clientId = 'cf53de31fa7f5424f3f23a15dae39d77';
  final String _redirectUri = 'myapp://auth-callback';
  final List<String> _scopes = <String>['write:users'];

  Future<void> _authenticate() async {
    final codeVerifier = generateCodeVerifier();
    final codeChallenge = codeVerifier;

    final authUrl = Uri.https(
      'myanimelist.net',
      '/v1/oauth2/authorize',
      {
        'response_type': 'code',
        'client_id': _clientId,
        'redirect_uri': _redirectUri,
        'code_challenge': codeChallenge,
        'code_challenge_method': 'plain',
        'scopes': _scopes
      },
    );

    try {
      // Open the WebView for authentication
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: Uri.parse(_redirectUri).scheme,
      );

      // Extract the authorization code from the redirect URL
      final code = Uri.parse(result).queryParameters['code'];
      if (code != null) {
        // Exchange the authorization code for an access token
        await exchangeCodeForToken(_clientId, code, _redirectUri, codeVerifier);
      }
    } catch (e) {
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
      final tokenData = jsonDecode(response.body);
      print('Access Token: ${tokenData['access_token']}');
      print('Refresh Token: ${tokenData['refresh_token']}');
      print('Expires In: ${tokenData['expires_in']}');
    } else {
      print('Token exchange failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ANIME LIST',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: _authenticate,
              child: const Text('Login with MyAnimeList'),
            ),
            const SizedBox(height: 20),
            Text('Access Token:', style: AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white)),
            if (_accessToken != null) ...[
              const SizedBox(height: 10),
              Text(
                _accessToken ?? 'TEXT',
                textAlign: TextAlign.center,
                style: AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 2),
    );
  }
}

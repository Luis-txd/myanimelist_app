import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';
import '../../theme/app_text_theme.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;

@RoutePage()
class AnimeScreen extends ConsumerStatefulWidget {
  const AnimeScreen({super.key});

  @override
  ConsumerState<AnimeScreen> createState() => _AnimeScreenState();
}

const FlutterAppAuth appAuth = FlutterAppAuth();

class _AnimeScreenState extends ConsumerState<AnimeScreen> {

  // if not logged in, include a button to go to the login page?
  String? _accessToken;

  Future<void> _authenticate() async {

    try {
      // Start the authorization flow
      final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          'cf53de31fa7f5424f3f23a15dae39d77',
          'myapp://auth-callback',
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: 'https://myanimelist.net/v1/oauth2/authorize',
            tokenEndpoint: 'https://myanimelist.net/v1/oauth2/token',
          ),
          scopes: ['write:users'],

        ),
      );

      print("RESULT");
      print(result);

      if (result != null) {
        setState(() {
          _accessToken = result.accessToken;
        });
      } else {
        print('Authentication failed. $result');
      }
    } catch (e, stacktrace) {
      print('ERROR: $e');
      print("Stacktrace: $stacktrace");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text('Login with MyAnimeList'),
            ),
            const SizedBox(height: 20),
            Text('Access Token:', style:  AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white)),
            if (_accessToken != null) ...[
              const SizedBox(height: 10),
              Text(_accessToken ?? 'TEXt', textAlign: TextAlign.center, style:  AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white),),
            ],
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 2),
    );
  }
}

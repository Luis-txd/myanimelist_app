import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';
import '../../theme/app_text_theme.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 3),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 1),
    );
  }
}

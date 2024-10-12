import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../resources/app_colours.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';

import '../../theme/app_text_theme.dart';

@RoutePage()
class MoreMenuScreen extends ConsumerStatefulWidget {
  const MoreMenuScreen({super.key});

  @override
  ConsumerState<MoreMenuScreen> createState() => _MoreMenuScreenState();
}

class _MoreMenuScreenState extends ConsumerState<MoreMenuScreen> {
  final String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().backgroundPrimary01,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GRID MENU',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 3),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myanimelist_app/resources/app_colours.dart';
import 'package:myanimelist_app/ui/components/navigation/bottom_navi_bar_widget.dart';

import '../../theme/app_text_theme.dart';

@RoutePage()
class AnimeScreen extends ConsumerStatefulWidget {
  const AnimeScreen({super.key});

  @override
  ConsumerState<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends ConsumerState<AnimeScreen> {
  final String _query = "";

   @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().backgroundPrimary01,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: IconButton(
                //TODO text button com texto a dizer Menu, sem background?
                onPressed: () {
                  //TODO send to profile page
                },
                icon: Icon(Icons.apps, color: AppColors().iconPrimary01)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    //TODO send to profile page
                  },
                  icon: Icon(Icons.person, color: AppColors().iconPrimary01)),
            ),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ANIME LIST',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNaviBar(selectedIndex: 1), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

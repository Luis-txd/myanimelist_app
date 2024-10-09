import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myanimelist_app/data/models/anime/anime_list.dart';
import 'package:myanimelist_app/data/models/common/common.dart';
import 'package:myanimelist_app/resources/app_colours.dart';
import 'package:myanimelist_app/ui/components/navigation/bottom_navi_bar_widget.dart';

import '../../theme/app_text_theme.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<AnimeListData> nodes = [
    AnimeListData(
        node: AnimeListNode(
            id: 21,
            title: "One Piece",
            mainPicture: MainPicture(
                medium:
                    "https://cdn.myanimelist.net/images/anime/1244/138851.jpg",
                large:
                    "https://cdn.myanimelist.net/images/anime/1244/138851l.jpg"))),
    AnimeListData(
        node: AnimeListNode(
            id: 31772,
            title: "One Punch Man",
            mainPicture: MainPicture(
                medium:
                    "https://cdn.myanimelist.net/images/anime/1452/97840.jpg",
                large:
                    "https://cdn.myanimelist.net/images/anime/1452/97840l.jpg"))),
    AnimeListData(
        node: AnimeListNode(
            id: 459,
            title: "One Piece Movie 1",
            mainPicture: MainPicture(
                medium:
                    "https://cdn.myanimelist.net/images/anime/1770/97704.jpg",
                large:
                    "https://cdn.myanimelist.net/images/anime/1770/97704l.jpg"))),
  ];

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
            decoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
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
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOMESCREEN',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nodes.length,
                itemBuilder: (context, index) {
                  final item = nodes[index];
                  return Row(
                    children: [
                      Image.network(
                        item.node.mainPicture.large,
                        height: 100,
                        cacheHeight: 100,
                      ),
                      Column(
                        children: [
                          Text(
                            item.node.title,
                            style: AppTextTheme()
                                .bodyNormal
                                .copyWith(height: 1, color: Colors.white),
                          ),
                          // SizedBox(width: 10),
                          // Text(
                          //   item.node.id.toString(),
                          //   style: AppTextTheme()
                          //       .bodyNormal
                          //       .copyWith(height: 1, color: Colors.white),
                          // ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(
          selectedIndex:
              0), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/anime/anime_list.dart';
import '../../../data/models/common/common.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';

import '../../theme/app_text_theme.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Home screen = Seasonal + Search Oage, com search bar
  // search e hub viram pags independentes de anime e manga
  // default state == planeed !!!!!! URGENTE !!!!!!
  // BttomVanBar customizable com pop quizz
  // Ves manga? Se nao, nao aparece menu do Manga lg na nav bar > aparece apenas na grelha
  // Usas Forum/Hub? Se nao, nao aparece > aparece apenas na grelha

  List<AnimeListData> nodes = <AnimeListData>[
    AnimeListData(
        node: AnimeListNode(
            id: 21,
            title: 'One Piece',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1244/138851.jpg',
                large: 'https://cdn.myanimelist.net/images/anime/1244/138851l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 31772,
            title: 'One Punch Man',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1452/97840.jpg',
                large: 'https://cdn.myanimelist.net/images/anime/1452/97840l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 459,
            title: 'One Piece Movie 1',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1770/97704.jpg',
                large: 'https://cdn.myanimelist.net/images/anime/1770/97704l.jpg'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOMESCREEN',
              style: AppTextTheme().h1.copyWith(height: 1, color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nodes.length,
                itemBuilder: (BuildContext context, int index) {
                  final AnimeListData item = nodes[index];
                  return Row(
                    children: <Widget>[
                      Image.network(
                        item.node.mainPicture.large,
                        height: 100,
                        cacheHeight: 100,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            item.node.title,
                            style: AppTextTheme().bodyNormal.copyWith(height: 1, color: Colors.white),
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
      bottomNavigationBar:
          const BottomNaviBar(selectedIndex: 0),
    );
  }
}

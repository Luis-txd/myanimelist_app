import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/anime/anime_list.dart';
import '../../../data/models/common/common.dart';
import '../../components/anime_rail/anime_rail.dart';
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

  // ter 2 tabs em cima, um com o discover, outro com seasonal anime

  List<AnimeListData> nodes = <AnimeListData>[
    AnimeListData(
        node: AnimeListNode(
            id: 21,
            title: 'One Piece',
            mainPicture: MainPicture(
                medium:
                    'https://cdn.myanimelist.net/images/anime/1244/138851.jpg',
                large:
                    'https://cdn.myanimelist.net/images/anime/1244/138851l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 31772,
            title: 'One Punch Man',
            mainPicture: MainPicture(
                medium:
                    'https://cdn.myanimelist.net/images/anime/1452/97840.jpg',
                large:
                    'https://cdn.myanimelist.net/images/anime/1452/97840l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 459,
            title: 'One Piece Movie 1',
            mainPicture: MainPicture(
                medium:
                    'https://cdn.myanimelist.net/images/anime/1770/97704.jpg',
                large:
                    'https://cdn.myanimelist.net/images/anime/1770/97704l.jpg'))),
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
              child: AnimeRail(title: "All", nodes: nodes),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 0),
    );
  }
}

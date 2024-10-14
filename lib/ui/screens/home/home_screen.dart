import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/anime/anime_list.dart';
import '../../../data/models/common/common.dart';
import '../../components/anime_rail/anime_rail.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';

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

  List<AnimeListData> randomRanked = <AnimeListData>[
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
    AnimeListData(
        node: AnimeListNode(
            id: 52991,
            title: 'Sousou no Frieren',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1015/138006.jpg',
                large: 'https://cdn.myanimelist.net/images/anime/1015/138006l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 9253,
            title: 'Steins;Gate',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1935/127974.webp',
                large: 'https://cdn.myanimelist.net/images/anime/1935/127974l.webp'))),
    AnimeListData(
        node: AnimeListNode(
            id: 56784,
            title: 'Bleach: Sennen Kessen-hen - Soukoku-tan',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1595/144074.jpg',
                large: 'https://cdn.myanimelist.net/images/anime/1595/144074l.jpg'))),
    AnimeListData(
        node: AnimeListNode(
            id: 5114,
            title: 'Fullmetal Alchemist: Brotherhood',
            mainPicture: MainPicture(
                medium: 'https://cdn.myanimelist.net/images/anime/1208/94745.webp',
                large: 'https://cdn.myanimelist.net/images/anime/1208/94745l.webp'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimeRail(title: 'Now Watching', nodes: randomRanked), // seasonal anime with the current date
              AnimeRail(
                  title: 'Trending',
                  nodes:
                      randomRanked), // type = bypopularity, and fielter by date (maybe beggining of the current season? last month?)
              AnimeRail(
                  title: 'Just Added',
                  nodes:
                      randomRanked), // https://api.myanimelist.net/v2/anime?q=&limit=10&fields=title,main_picture,start_date,end_date,mean&start_date=2024-10-01
              AnimeRail(title: 'Top 10 Airing', nodes: randomRanked), // type = airing
              AnimeRail(title: 'Top 10 Upcoming', nodes: randomRanked), //type=upcoming
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(selectedIndex: 0),
    );
  }
}

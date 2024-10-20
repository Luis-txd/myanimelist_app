import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/anime/anime_list.dart';
import '../../../data/providers/anime/anime_data_provider.dart';
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

  AnimeListModel? nowWatching;
  final nowWatchingRequestParams = AnimeRankingParams(ranking_type: 'all'); // switch top seasonal with current seasons
  final topAiringRequestParams = AnimeRankingParams(ranking_type: 'airing');
  final topUpcomingRequestParams = AnimeRankingParams(ranking_type: 'upcoming');
  final trendingRequestParams = AnimeRankingParams(
      ranking_type:
          'bypopularity'); // type = bypopularity, and filter by date (maybe beggining of the current season? last month?)
  // final justAdded // https://api.myanimelist.net/v2/anime?q=&limit=10&fields=title,main_picture,start_date,end_date,mean&start_date=2024-10-01
  @override
  void initState() {
    super.initState();
    /*_loadRankings('all');*/
  }

  void _refreshAnimeRankings() {
    ref.invalidate(animeRankingProvider(nowWatchingRequestParams));
    ref.invalidate(animeRankingProvider(trendingRequestParams));
    ref.invalidate(animeRankingProvider(topAiringRequestParams));
    ref.invalidate(animeRankingProvider(topUpcomingRequestParams));
    /*refreshTr*/
  }

  Widget buildRailErrorWidget(error, stacktrace) {
    log(error.toString());
    log(stacktrace.toString());
    return Container();
  }

  Widget buildLoadingRail() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowWatchingInfo = ref.watch(animeRankingProvider(nowWatchingRequestParams));
    final trendingInfo = ref.watch(animeRankingProvider(trendingRequestParams));
    final topAiringInfo = ref.watch(animeRankingProvider(topAiringRequestParams));
    final topUpcomingInfo = ref.watch(animeRankingProvider(topUpcomingRequestParams));

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1), _refreshAnimeRankings);
      },
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                nowWatchingInfo.when(
                  data: (info) {
                    return AnimeRail(title: 'Now Watching', item: info.data);
                  },
                  error: buildRailErrorWidget,
                  loading: buildLoadingRail,
                ),
                const SizedBox(height: 12.0),
                trendingInfo.when(
                  data: (info) {
                    return AnimeRail(title: 'Trending', item: info.data);
                  },
                  error: buildRailErrorWidget,
                  loading: buildLoadingRail,
                ),
                const SizedBox(height: 12.0),
                topAiringInfo.when(
                  data: (info) {
                    return AnimeRail(title: 'Top 10 Airing', item: info.data);
                  },
                  error: buildRailErrorWidget,
                  loading: buildLoadingRail,
                ),
                const SizedBox(height: 12.0),
                topUpcomingInfo.when(
                  data: (info) {
                    return AnimeRail(title: 'Top 10 Upcoming', item: info.data);
                  },
                  error: buildRailErrorWidget,
                  loading: buildLoadingRail,
                ),
                const SizedBox(height: 12.0),
                /*AnimeRail(
                    title: 'Trending',
                    nodes:
                        randomRanked), // type = bypopularity, and fielter by date (maybe beggining of the current season? last month?)
                AnimeRail(
                    title: 'Just Added',
                    nodes:
                        randomRanked), // https://api.myanimelist.net/v2/anime?q=&limit=10&fields=title,main_picture,start_date,end_date,mean&start_date=2024-10-01
                AnimeRail(title: 'Top 10 Upcoming', nodes: randomRanked), */ //type=upcoming
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNaviBar(selectedIndex: 0),
      ),
    );
  }
}

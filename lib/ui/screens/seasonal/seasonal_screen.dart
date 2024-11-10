import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/anime/anime_seasonal.dart';
import '../../../data/providers/anime/anime_data_provider.dart';
import '../../../resources/app_colours.dart';
import '../../../utils/AppUtils.dart';
import '../../components/anime_grid/anime_card.dart';
import '../../components/anime_grid/anime_grid_error.dart';
import '../../components/anime_grid/anime_grid_loader.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';

@RoutePage()
class SeasonalScreen extends ConsumerStatefulWidget {
  const SeasonalScreen({super.key});

  @override
  ConsumerState<SeasonalScreen> createState() => _SeasonalScreenState();
}

class _SeasonalScreenState extends ConsumerState<SeasonalScreen> {
  late AnimeSeasonalParams seasonalParams;
  late int selectedYear;
  late String selectedSeason;

  static const double kDefaultChildAspectRatio = 0.58;
  static const double kDefaultCrossAxisSpacing = 4.0;
  static const double kDefaultMainAxisSpacing = 4.0;

  static const double kDefaultPageHorizontalPadding = 5;

  @override
  void initState() {
    super.initState();

    final DateTime now = DateTime.now();
    selectedYear = now.year;
    selectedSeason = getSeasonByMonth(now.month);

    seasonalParams = AnimeSeasonalParams(
        year: selectedYear,
        season: selectedSeason,
        limit: 30,
        fields: 'mean,num_list_users,genres,start_date',
        sort: 'anime_num_list_users');
  }

  void _refreshSeasonalAnimes() {
    ref.invalidate(animeSeasonalProvider(seasonalParams));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildRailErrorWidget(Object error, StackTrace stacktrace) {
    log(error.toString());
    log(stacktrace.toString());
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final seasonalAnimeList = ref.watch(animeSeasonalProvider(seasonalParams));

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
            const Duration(seconds: 1), _refreshSeasonalAnimes);
      },
      child: Scaffold(
          appBar: const AppBarWidget(),
          body: Column(
            children: [
              Row(
                children: [
                  //
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPageHorizontalPadding),
                child: seasonalAnimeList.when(
                  data: (info) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: kDefaultCrossAxisSpacing,
                        mainAxisSpacing: kDefaultMainAxisSpacing,
                        childAspectRatio:
                            kDefaultChildAspectRatio, // default with no tags: 0.65
                      ),
                      itemCount: seasonalAnimeList.value?.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = info.data[index];
                        return AnimeCard(item: item.node);
                      },
                    );
                  },
                  error: (error, stacktrace) => AnimeGridError(
                    error: error,
                    stacktrace: stacktrace,
                  ),
                  loading: () => const AnimeGridLoader(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNaviBar(selectedIndex: 1)),
    );
  }
}

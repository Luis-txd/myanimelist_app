import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/anime/anime_data_provider.dart';
import '../../../utils/AppUtils.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/navigation/bottom_navi_bar_widget.dart';
import '../../theme/app_text_theme.dart';

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

  @override
  void initState() {
    super.initState();

    final DateTime now = DateTime.now();
    selectedYear = now.year;
    selectedSeason = getSeasonByMonth(now.month);

    seasonalParams = AnimeSeasonalParams(year: selectedYear, season: selectedSeason, limit: 15);
  }

  void _refreshSeasonalAnimes() {
    ref.invalidate(animeSeasonalProvider(seasonalParams));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildRailErrorWidget(error, stacktrace) {
    log(error.toString());
    log(stacktrace.toString());
    return Container();
  }

  Widget buildLoadingRail() {
    return const Center(
      child: SizedBox(
        height: 165.0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static const double kDefaultItemWidth = 110.0;
  static const double kDefaultItemHeight = 165.0;

  // TODO(luistxd): passar helper methods de widget (çoading/error) para um novo stateless widget
  // assim, ter 3 ficheiros numa pasta de componentes (ex: anime_rail, anime_rail_loader, anime_rail_error)

  @override
  Widget build(BuildContext context) {
    final seasonalAnimeList = ref.watch(animeSeasonalProvider(seasonalParams));

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1), _refreshSeasonalAnimes);
      },
      child: Scaffold(
          appBar: const AppBarWidget(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: seasonalAnimeList.when(
                        data: (info) {
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: seasonalAnimeList.value?.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = info.data[index];
                              return Column(
                                children: [
                                  SizedBox(
                                    height: kDefaultItemHeight,
                                    width: kDefaultItemWidth,
                                    child: item.node.main_picture != null
                                        ? CachedNetworkImage(
                                            imageUrl: item.node.main_picture!.medium,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              // TODO(luistxd): replace with placehold asset
                                              print('Error: $error');
                                              return const Center(
                                                child: Text('Error'),
                                              );
                                            },
                                            errorListener: (e) {
                                              debugPrint('Image Exception is: ${e.runtimeType}');
                                            },
                                          )
                                        : Container(), // TODO(luistxd): replace with placehold asset
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: kDefaultItemWidth,
                                    child: Text(
                                      item.node.title,
                                      style: AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        error: buildRailErrorWidget,
                        loading: buildLoadingRail),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomNaviBar(selectedIndex: 1)),
    );
  }
}

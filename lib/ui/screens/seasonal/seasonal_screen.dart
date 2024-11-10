import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/anime/anime_seasonal.dart';
import '../../../data/providers/anime/anime_data_provider.dart';
import '../../../resources/app_colours.dart';
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

  static const double kDefaultItemWidth = 180.0;
  static const double kDefaultItemHeight = 255.0;
  static const int kDefaultNumTags = 2;

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

  Widget buildSeasonalCard(AnimeSeasonalData item) {
    return Card(
      elevation: 0.0,
      color: AppColors().backgroundPrimary01,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          children: [
            Stack(
              children: [
                if (item.node.main_picture != null) ...[
                  Container(
                    width: kDefaultItemWidth,
                    height: kDefaultItemHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CachedNetworkImage(
                      imageUrl: item.node.main_picture!.large ?? item.node.main_picture!.medium,
                      width: double.infinity,
                      height: double.infinity,
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
                    ),
                  )
                ] else ...[
                  Container(),
                ], // TODO(luistxd): replace with placehold asset
                if (item.node.mean != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '★ ${item.node.mean?.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 12),
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
            if (item.node.genres != null) ...[
              const SizedBox(height: 5),
              SizedBox(
                width: kDefaultItemWidth,
                child: Wrap(
                    spacing: 4,
                    children: item.node.genres!
                        .take(kDefaultNumTags)
                        .map(
                          (e) => Chip(
                            label: Text(
                              e.name,
                              style: AppTextTheme().bodyXSmall.copyWith(height: 1, color: Colors.white),
                            ),
                            backgroundColor: AppColors().tagPrimaryColor01,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            padding: EdgeInsets.zero, // Removes internal padding
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ), // Reduces space around text
                          ),
                        )
                        .toList()),
              ),
            ]
          ],
        ),
      ),
    );
  }

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPageHorizontalPadding),
            child: seasonalAnimeList.when(
                data: (info) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultCrossAxisSpacing,
                      mainAxisSpacing: kDefaultMainAxisSpacing,
                      childAspectRatio: kDefaultChildAspectRatio, // default with no tags: 0.65
                    ),
                    itemCount: seasonalAnimeList.value?.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = info.data[index];
                      return buildSeasonalCard(item);
                    },
                  );
                },
                error: buildRailErrorWidget,
                loading: buildLoadingRail),
          ),
          bottomNavigationBar: const BottomNaviBar(selectedIndex: 1)),
    );
  }
}

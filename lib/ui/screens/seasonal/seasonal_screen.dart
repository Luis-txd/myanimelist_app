import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/anime/anime_data_provider.dart';
import '../../../utils/AppUtils.dart';
import '../../components/anime_grid/anime_card.dart';
import '../../components/anime_grid/anime_grid_error.dart';
import '../../components/anime_grid/anime_grid_loader.dart';
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

  static const double kDefaultChildAspectRatio = 0.58;
  static const double kDefaultCrossAxisSpacing = 4.0;
  static const double kDefaultMainAxisSpacing = 4.0;

  static const double kDefaultPageHorizontalPadding = 5;

  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    final DateTime now = DateTime.now();
    selectedYear = now.year;
    selectedSeason = getSeasonByMonth(now.month);

    _scrollController = FixedExtentScrollController(
      initialItem: selectedYear -
          1910, // Set the initial position based on selected year
    );

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


  Widget buildTopBarSeasonYearIndicatorV2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Container(),
      ),
    );
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPageHorizontalPadding, vertical: 5),
          child: SizedBox(
            height: 800,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TabBar(
                              labelColor: Colors.white,
                              dividerColor: Colors.transparent,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              unselectedLabelColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.tab,
                              splashFactory: NoSplash.splashFactory,
                              indicator: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(
                                    24),
                              ),
                              tabs: const [
                                Align(
                                  child: SizedBox(
                                    width: 80,
                                    child: Tab(text: 'Last'),
                                  ),
                                ),
                                // Larger middle tab
                                Align(
                                  child: SizedBox(
                                    width: 150, // Fixed width for middle tab
                                    child: Tab(text: 'This Season'),
                                  ),
                                ),
                                // Smaller outer tab
                                Align(
                                  child: SizedBox(
                                    width: 80, // Fixed width for outer tab
                                    child: Tab(text: 'Next'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Button action
                          },
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text("Content for Tab 1")),
                        Center(child: Text("Content for Tab 2")),
                        Center(child: Text("Content for Tab 3")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNaviBar(selectedIndex: 1),
      ),
    );
  }
}

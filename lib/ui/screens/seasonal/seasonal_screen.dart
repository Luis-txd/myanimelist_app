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

  Widget buildSelectionDialog(BuildContext context) {
    final ButtonStyle seasonsBtnStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), //TODO fzr dialog mais round nos corners
        side: const BorderSide(),
      ),
      backgroundColor: Colors.white,
    );

    const int startYear = 1910;
    final int endYear = DateTime.now().year;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0, left: 12.0, right: 12.0),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20), // Rounded corners on all sides
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Seasons'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            style: seasonsBtnStyle,
                            onPressed: () {},
                            icon: const Icon(Icons.cloudy_snowing),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            style: seasonsBtnStyle,
                            onPressed: () {},
                            icon: const Icon(Icons.park),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            style: seasonsBtnStyle,
                            onPressed: () {},
                            icon: const Icon(Icons.sunny),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            style: seasonsBtnStyle,
                            onPressed: () {},
                            icon: const Icon(Icons.air_sharp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Year'),
                    SizedBox(
                      height: 150,
                      width: 100,
                      // TODO(luistxd): fix scroll controller once the dialog closes
                      child: ListWheelScrollView.useDelegate(
                        controller: _scrollController,
                        itemExtent: 50,
                        perspective: 0.005,
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedYear = startYear + index;
                          });
                        },
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: endYear - startYear + 1,
                          builder: (context, index) {
                            if (index < 0 || index > endYear - startYear) {
                              return null;
                            }
                            final year = startYear + index;

                            return SizedBox(
                              width: 55,
                              child: Center(
                                child: Text(
                                  (startYear + index).toString(),
                                  style: AppTextTheme().bodyLargeBold.copyWith(
                                        height: 1,
                                        color: selectedYear == year
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.3),
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final seasonalAnimeList = ref.watch(animeSeasonalProvider(seasonalParams));

    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white);

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            style: style,
                            onPressed: () {}, // TODO: show dialog
                            icon: const Icon(Icons.sunny),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 60,
                          child: FilledButton.tonal(
                            style: style,
                            onPressed: () => showModalBottomSheet<String>(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  _scrollController =
                                      FixedExtentScrollController(
                                    initialItem: selectedYear -
                                        1910, // Set the initial position based on selected year
                                  );
                                  return buildSelectionDialog(context);
                                }),
                            child: Text(selectedYear.toString() ?? ''),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: seasonalAnimeList.when(
                      data: (info) {
                        return GridView.builder(
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
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
            ),
          ),
          bottomNavigationBar: const BottomNaviBar(selectedIndex: 1)),
    );
  }
}

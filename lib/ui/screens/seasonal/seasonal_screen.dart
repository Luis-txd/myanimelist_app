import 'package:auto_route/auto_route.dart';
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
    
    seasonalParams = AnimeSeasonalParams(year: selectedYear, season: selectedSeason);
  }

  void _refreshSeasonalAnimes() {
    ref.invalidate(animeSeasonalProvider(seasonalParams));
  }

  @override
  void dispose() {
    super.dispose();
  }
  
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

        ),
    );
  }
}

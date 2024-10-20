import '../general/cache_manager.dart';
import 'anime_data_provider.dart';

class AnimeCacheManager extends CacheManager {
  static const String animeRankingBaseKey = 'anime_ranking';
  static const String animeSeasonalBaseKey = 'anime_seasonal';

  String _getRankingKey(String baseKey, AnimeRankingParams params) {
    final keys = [baseKey];

    if (params.limit != null) {
      keys.add(params.limit!.toString());
    }

    if (params.offset != null) {
      keys.add(params.offset!.toString());
    }

    if (params.ranking_type != null) {
      keys.add(params.ranking_type!);
    }

    return keys.join('_');
  }

  String _getSeasonalKey(String baseKey, AnimeSeasonalParams params) {
    final keys = [baseKey];

    if (params.limit != null) {
      keys.add(params.limit!.toString());
    }

    if (params.offset != null) {
      keys.add(params.offset!.toString());
    }

    keys.add(params.year.toString());
    keys.add(params.season);

    return keys.join('_');
  }

  // Anime Ranking
  Future<String?> getAnimeRankingList(AnimeRankingParams params) async {
    final key = _getRankingKey(animeRankingBaseKey, params);
    return get(key);
  }

  Future<void> setAnimeRankingList(String data, AnimeRankingParams params) async {
    final key = _getRankingKey(animeRankingBaseKey, params);
    await set(key, data);
  }

  Future<void> delAnimeRankingList(String key, AnimeRankingParams params) async {
    final key = _getRankingKey(animeRankingBaseKey, params);
    await del(key);
  }

  // Anime Seasonal
  Future<String?> getAnimeSeasonalList(AnimeSeasonalParams params) async {
    final key = _getSeasonalKey(animeSeasonalBaseKey, params);
    return get(key);
  }

  Future<void> setAnimeSeasonalList(String data, AnimeSeasonalParams params) async {
    final key = _getSeasonalKey(animeSeasonalBaseKey, params);
    await set(key, data);
  }

  Future<void> delAnimeSeasonalList(String key, AnimeSeasonalParams params) async {
    final key = _getSeasonalKey(animeSeasonalBaseKey, params);
    await del(key);
  }
}

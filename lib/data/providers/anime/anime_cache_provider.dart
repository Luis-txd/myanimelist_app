import '../general/cache_manager.dart';
import 'anime_data_provider.dart';

class AnimeCacheManager extends CacheManager {
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

  Future<String?> getAnimeRankingList(AnimeRankingParams params) async {
    final key = _getRankingKey('anime_ranking', params);
    await get(key);
    return null;
  }

  Future<void> setAnimeRankingList(String data, AnimeRankingParams params) async {
    final key = _getRankingKey('anime_ranking', params);
    await set(key, data);
  }

  Future<void> delAnimeRankingList(String key, AnimeRankingParams params) async {
    final key = _getRankingKey('anime_ranking', params);
    await del(key);
  }
}

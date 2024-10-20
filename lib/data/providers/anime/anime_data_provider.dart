import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/anime/anime_list.dart';
import '../../models/anime/anime_ranking.dart';
import '../../models/anime/anime_seasonal.dart';
import '../../remote/mal_rest_dio.dart';
import '../../remote/rest_client.dart';
import 'anime_cache_provider.dart';

final animeCacheProvider = Provider((ref) => AnimeCacheManager());

class AnimeRankingParams {
  AnimeRankingParams({this.limit, this.offset, this.ranking_type, this.fields});
  final int? limit;
  final int? offset;
  final String? ranking_type;
  final String? fields;
}

class AnimeListParams {
  AnimeListParams({this.limit, this.offset, this.q, this.fields});

  final int? limit;
  final int? offset;
  final String? fields;
  final String? q; // query for search
}

class AnimeSeasonalParams {
  AnimeSeasonalParams({
    this.limit,
    this.offset,
    this.sort,
    this.fields,
    required this.year,
    required this.season,
  });

  final int? limit;
  final int? offset;
  final String? fields;
  final String? sort; // anime_score or anime_num_list_users

  final int year;
  final String season;
}

final animeListProvider = FutureProvider.autoDispose.family<AnimeListModel, AnimeListParams>((ref, params) async {
  final RestClient client = ref.watch(restClientMALProvider);

  // TODO(luistxd): implement caching on this request

  try {
    final AnimeListModel data =
        await client.getAnimeList(limit: params.limit, offset: params.offset, fields: params.fields, q: params.q);
    return data;
  } catch (error) {
    rethrow;
  }
});

final animeRankingProvider = FutureProvider.autoDispose.family<AnimeRankingModel, AnimeRankingParams>(
  (ref, params) async {
    final RestClient client = ref.watch(restClientMALProvider);
    final cacheManager = ref.watch(animeCacheProvider);

    final cachedData = await cacheManager.getAnimeRankingList(params);

    // How does this work?
    if (cachedData != null) {
      final cachedAnimeRankings = AnimeRankingModel.fromJson(json.decode(cachedData) as Map<String, dynamic>);
      ref.state = AsyncValue.data(cachedAnimeRankings);
    }

    try {
      final AnimeRankingModel data =
          await client.getAnimeRanking(limit: params.limit, offset: params.offset, ranking_type: params.ranking_type);
      await cacheManager.setAnimeRankingList(json.encode(data.toJson()), params);
      return data;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching anime ranking: $error');
      }
      if (cachedData != null) {
        return AnimeRankingModel.fromJson(json.decode(cachedData) as Map<String, dynamic>);
      }
      rethrow;
    }
  },
);

final animeSeasonalProvider = FutureProvider.autoDispose.family<AnimeSeasonalModel, AnimeSeasonalParams>(
  (ref, params) async {
    final RestClient client = ref.watch(restClientMALProvider);
    final cacheManager = ref.watch(animeCacheProvider);

    final cachedData = await cacheManager.getAnimeSeasonalList(params);

    if (cachedData != null) {
      final cachedAnimeRankings = AnimeSeasonalModel.fromJson(json.decode(cachedData) as Map<String, dynamic>);
      ref.state = AsyncValue.data(cachedAnimeRankings);
    }

    try {
      final AnimeSeasonalModel data = await client.getAnimeSeasonal(params.season, params.year,
          sort: params.sort, limit: params.limit, offset: params.offset, fields: params.fields);
      await cacheManager.setAnimeSeasonalList(json.encode(data.toJson()), params);
      return data;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching anime ranking: $error');
      }
      if (cachedData != null) {
        return AnimeSeasonalModel.fromJson(json.decode(cachedData) as Map<String, dynamic>);
      }
      rethrow;
    }
  },
);

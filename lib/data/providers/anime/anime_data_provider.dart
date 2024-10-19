import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/anime/anime_list.dart';
import '../../models/anime/anime_ranking.dart';
import '../../remote/mal_rest_dio.dart';
import '../../remote/rest_client.dart';

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

final animeListProvider = FutureProvider.autoDispose.family<AnimeListModel, AnimeListParams>((ref, params) async {
  final RestClient client = ref.watch(restClientMALProvider);

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

    try {
      final AnimeRankingModel data =
          await client.getAnimeRanking(limit: params.limit, offset: params.offset, ranking_type: params.ranking_type);
      return data;
    } catch (error) {
      rethrow;
    }
  },
);

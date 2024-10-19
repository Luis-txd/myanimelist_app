import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/anime/anime_detail.dart';
import '../models/anime/anime_list.dart';
import '../models/anime/anime_ranking.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  //https://api.myanimelist.net/v2/anime?q=one&limit=4
  @GET('anime')
  Future<AnimeListModel> getAnimeList({
    @Query('limit') int? limit = 4,
    @Query('offset') int? offset = 0,
    @Query('q') String? q,
    @Query('fields') String? fields,
  });

  //https://api.myanimelist.net/v2/anime/30230?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics
  @GET('anime/{animeId}')
  Future<AnimeDetail> getAnimeDetail(
    @Path('animeId') int animeId,
  );

  @GET('anime/ranking')
  Future<AnimeRankingModel> getAnimeRanking({
    @Query('limit') int? limit = 4,
    @Query('offset') int? offset = 0,
    @Query('ranking_type') String? ranking_type = 'all',
  });
}

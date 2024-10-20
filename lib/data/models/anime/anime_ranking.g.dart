// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeRankingModel _$AnimeRankingModelFromJson(Map<String, dynamic> json) => AnimeRankingModel(
      data: (json['data'] as List<dynamic>).map((e) => AnimeRankingData.fromJson(e as Map<String, dynamic>)).toList(),
      paging: AnimePaging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeRankingModelToJson(AnimeRankingModel instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
    };

AnimeRankingData _$AnimeRankingDataFromJson(Map<String, dynamic> json) => AnimeRankingData(
      node: AnimeNode.fromJson(json['node'] as Map<String, dynamic>),
      ranking: AnimeRanking.fromJson(json['ranking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeRankingDataToJson(AnimeRankingData instance) => <String, dynamic>{
      'node': instance.node.toJson(),
      'ranking': instance.ranking.toJson(),
    };

AnimeRanking _$AnimeRankingFromJson(Map<String, dynamic> json) => AnimeRanking(
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$AnimeRankingToJson(AnimeRanking instance) => <String, dynamic>{
      'rank': instance.rank,
    };

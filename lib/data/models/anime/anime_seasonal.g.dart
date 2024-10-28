// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_seasonal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeSeasonalModel _$AnimeSeasonalModelFromJson(Map<String, dynamic> json) => AnimeSeasonalModel(
      data: (json['data'] as List<dynamic>).map((e) => AnimeSeasonalData.fromJson(e as Map<String, dynamic>)).toList(),
      paging: AnimePaging.fromJson(json['paging'] as Map<String, dynamic>),
      season: AnimeSeason.fromJson(json['season'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeSeasonalModelToJson(AnimeSeasonalModel instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
      'season': instance.season.toJson(),
    };

AnimeSeasonalData _$AnimeSeasonalDataFromJson(Map<String, dynamic> json) => AnimeSeasonalData(
      node: AnimeNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeSeasonalDataToJson(AnimeSeasonalData instance) => <String, dynamic>{
      'node': instance.node.toJson(),
    };

AnimeSeason _$AnimeSeasonFromJson(Map<String, dynamic> json) => AnimeSeason(
      year: (json['year'] as num).toInt(),
      season: json['season'] as String,
    );

Map<String, dynamic> _$AnimeSeasonToJson(AnimeSeason instance) => <String, dynamic>{
      'year': instance.year,
      'season': instance.season,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetail _$AnimeDetailFromJson(Map<String, dynamic> json) => AnimeDetail(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      mainPicture: MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      alternativeTitles: AlternativeTitles.fromJson(json['alternativeTitles'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      synopsis: json['synopsis'] as String,
      mean: (json['mean'] as num).toDouble(),
      rank: (json['rank'] as num).toInt(),
      popularity: (json['popularity'] as num).toInt(),
      numListUsers: (json['numListUsers'] as num).toInt(),
      numScoringUsers: (json['numScoringUsers'] as num).toInt(),
      nsfw: json['nsfw'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      mediaType: json['mediaType'] as String,
      status: json['status'] as String,
      genres: (json['genres'] as List<dynamic>).map((e) => Genre.fromJson(e as Map<String, dynamic>)).toList(),
      myListStatus: MyListStatus.fromJson(json['myListStatus'] as Map<String, dynamic>),
      numEpisodes: (json['numEpisodes'] as num).toInt(),
      startSeason: StartSeason.fromJson(json['startSeason'] as Map<String, dynamic>),
      broadcast: Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      source: json['source'] as String,
      averageEpisodeDuration: (json['averageEpisodeDuration'] as num).toInt(),
      rating: json['rating'] as String,
      pictures:
          (json['pictures'] as List<dynamic>).map((e) => MainPicture.fromJson(e as Map<String, dynamic>)).toList(),
      background: json['background'] as String,
      relatedAnime:
          (json['relatedAnime'] as List<dynamic>).map((e) => RelatedAnime.fromJson(e as Map<String, dynamic>)).toList(),
      relatedManga: json['relatedManga'] as List<dynamic>,
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      studios: (json['studios'] as List<dynamic>).map((e) => Genre.fromJson(e as Map<String, dynamic>)).toList(),
      statistics: Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDetailToJson(AnimeDetail instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainPicture': instance.mainPicture.toJson(),
      'alternativeTitles': instance.alternativeTitles.toJson(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'synopsis': instance.synopsis,
      'mean': instance.mean,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'numListUsers': instance.numListUsers,
      'numScoringUsers': instance.numScoringUsers,
      'nsfw': instance.nsfw,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'mediaType': instance.mediaType,
      'status': instance.status,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'myListStatus': instance.myListStatus.toJson(),
      'numEpisodes': instance.numEpisodes,
      'startSeason': instance.startSeason.toJson(),
      'broadcast': instance.broadcast.toJson(),
      'source': instance.source,
      'averageEpisodeDuration': instance.averageEpisodeDuration,
      'rating': instance.rating,
      'pictures': instance.pictures.map((e) => e.toJson()).toList(),
      'background': instance.background,
      'relatedAnime': instance.relatedAnime.map((e) => e.toJson()).toList(),
      'relatedManga': instance.relatedManga,
      'recommendations': instance.recommendations.map((e) => e.toJson()).toList(),
      'studios': instance.studios.map((e) => e.toJson()).toList(),
      'statistics': instance.statistics.toJson(),
    };

AlternativeTitles _$AlternativeTitlesFromJson(Map<String, dynamic> json) => AlternativeTitles(
      synonyms: (json['synonyms'] as List<dynamic>).map((e) => e as String).toList(),
      en: json['en'] as String,
      ja: json['ja'] as String,
    );

Map<String, dynamic> _$AlternativeTitlesToJson(AlternativeTitles instance) => <String, dynamic>{
      'synonyms': instance.synonyms,
      'en': instance.en,
      'ja': instance.ja,
    };

Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => Broadcast(
      dayOfTheWeek: json['dayOfTheWeek'] as String,
      startTime: json['startTime'] as String,
    );

Map<String, dynamic> _$BroadcastToJson(Broadcast instance) => <String, dynamic>{
      'dayOfTheWeek': instance.dayOfTheWeek,
      'startTime': instance.startTime,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MyListStatus _$MyListStatusFromJson(Map<String, dynamic> json) => MyListStatus(
      status: json['status'] as String,
      score: (json['score'] as num).toInt(),
      numEpisodesWatched: (json['numEpisodesWatched'] as num).toInt(),
      isRewatching: json['isRewatching'] as bool,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MyListStatusToJson(MyListStatus instance) => <String, dynamic>{
      'status': instance.status,
      'score': instance.score,
      'numEpisodesWatched': instance.numEpisodesWatched,
      'isRewatching': instance.isRewatching,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) => Recommendation(
      node: AnimeNode.fromJson(json['node'] as Map<String, dynamic>),
      numRecommendations: (json['numRecommendations'] as num).toInt(),
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) => <String, dynamic>{
      'node': instance.node.toJson(),
      'numRecommendations': instance.numRecommendations,
    };

RelatedAnime _$RelatedAnimeFromJson(Map<String, dynamic> json) => RelatedAnime(
      node: AnimeNode.fromJson(json['node'] as Map<String, dynamic>),
      relationType: json['relationType'] as String,
      relationTypeFormatted: json['relationTypeFormatted'] as String,
    );

Map<String, dynamic> _$RelatedAnimeToJson(RelatedAnime instance) => <String, dynamic>{
      'node': instance.node.toJson(),
      'relationType': instance.relationType,
      'relationTypeFormatted': instance.relationTypeFormatted,
    };

StartSeason _$StartSeasonFromJson(Map<String, dynamic> json) => StartSeason(
      year: (json['year'] as num).toInt(),
      season: json['season'] as String,
    );

Map<String, dynamic> _$StartSeasonToJson(StartSeason instance) => <String, dynamic>{
      'year': instance.year,
      'season': instance.season,
    };

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      numListUsers: (json['numListUsers'] as num).toInt(),
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) => <String, dynamic>{
      'status': instance.status.toJson(),
      'numListUsers': instance.numListUsers,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      watching: json['watching'] as String,
      completed: json['completed'] as String,
      onHold: json['onHold'] as String,
      dropped: json['dropped'] as String,
      planToWatch: json['planToWatch'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'watching': instance.watching,
      'completed': instance.completed,
      'onHold': instance.onHold,
      'dropped': instance.dropped,
      'planToWatch': instance.planToWatch,
    };

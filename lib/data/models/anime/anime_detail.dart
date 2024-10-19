import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';
part 'anime_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeDetail {
  AnimeDetail({
    required this.id,
    required this.title,
    required this.mainPicture,
    required this.alternativeTitles,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.mean,
    required this.rank,
    required this.popularity,
    required this.numListUsers,
    required this.numScoringUsers,
    required this.nsfw,
    required this.createdAt,
    required this.updatedAt,
    required this.mediaType,
    required this.status,
    required this.genres,
    required this.myListStatus,
    required this.numEpisodes,
    required this.startSeason,
    required this.broadcast,
    required this.source,
    required this.averageEpisodeDuration,
    required this.rating,
    required this.pictures,
    required this.background,
    required this.relatedAnime,
    required this.relatedManga,
    required this.recommendations,
    required this.studios,
    required this.statistics,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) => _$AnimeDetailFromJson(json);
  int id;
  String title;
  MainPicture mainPicture;
  AlternativeTitles alternativeTitles;
  DateTime startDate;
  DateTime endDate;
  String synopsis;
  double mean;
  int rank;
  int popularity;
  int numListUsers;
  int numScoringUsers;
  String nsfw;
  DateTime createdAt;
  DateTime updatedAt;
  String mediaType;
  String status;
  List<Genre> genres;
  MyListStatus myListStatus;
  int numEpisodes;
  StartSeason startSeason;
  Broadcast broadcast;
  String source;
  int averageEpisodeDuration;
  String rating;
  List<MainPicture> pictures;
  String background;
  List<RelatedAnime> relatedAnime;
  List<dynamic> relatedManga;
  List<Recommendation> recommendations;
  List<Genre> studios;
  Statistics statistics;

  Map<String, dynamic> toJson() => _$AnimeDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AlternativeTitles {
  AlternativeTitles({
    required this.synonyms,
    required this.en,
    required this.ja,
  });

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) => _$AlternativeTitlesFromJson(json);
  List<String> synonyms;
  String en;
  String ja;

  Map<String, dynamic> toJson() => _$AlternativeTitlesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Broadcast {
  Broadcast({
    required this.dayOfTheWeek,
    required this.startTime,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);
  String dayOfTheWeek;
  String startTime;

  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  int id;
  String name;

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyListStatus {
  MyListStatus({
    required this.status,
    required this.score,
    required this.numEpisodesWatched,
    required this.isRewatching,
    required this.updatedAt,
  });

  factory MyListStatus.fromJson(Map<String, dynamic> json) => _$MyListStatusFromJson(json);
  String status;
  int score;
  int numEpisodesWatched;
  bool isRewatching;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => _$MyListStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Recommendation {
  Recommendation({
    required this.node,
    required this.numRecommendations,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);
  AnimeNode node;
  int numRecommendations;

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RelatedAnime {
  RelatedAnime({
    required this.node,
    required this.relationType,
    required this.relationTypeFormatted,
  });

  factory RelatedAnime.fromJson(Map<String, dynamic> json) => _$RelatedAnimeFromJson(json);
  AnimeNode node;
  String relationType;
  String relationTypeFormatted;

  Map<String, dynamic> toJson() => _$RelatedAnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StartSeason {
  StartSeason({
    required this.year,
    required this.season,
  });

  factory StartSeason.fromJson(Map<String, dynamic> json) => _$StartSeasonFromJson(json);
  int year;
  String season;

  Map<String, dynamic> toJson() => _$StartSeasonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Statistics {
  Statistics({
    required this.status,
    required this.numListUsers,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);
  Status status;
  int numListUsers;

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Status {
  Status({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  String watching;
  String completed;
  String onHold;
  String dropped;
  String planToWatch;

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

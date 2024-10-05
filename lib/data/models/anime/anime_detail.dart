import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';
part 'anime_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeDetail {
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

  Map<String, dynamic> toJson() => _$AnimeDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AlternativeTitles {
  List<String> synonyms;
  String en;
  String ja;

  AlternativeTitles({
    required this.synonyms,
    required this.en,
    required this.ja,
  });

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) => _$AlternativeTitlesFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeTitlesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Broadcast {
  String dayOfTheWeek;
  String startTime;

  Broadcast({
    required this.dayOfTheWeek,
    required this.startTime,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}


@JsonSerializable(explicitToJson: true)
class MyListStatus {
  String status;
  int score;
  int numEpisodesWatched;
  bool isRewatching;
  DateTime updatedAt;

  MyListStatus({
    required this.status,
    required this.score,
    required this.numEpisodesWatched,
    required this.isRewatching,
    required this.updatedAt,
  });

  factory MyListStatus.fromJson(Map<String, dynamic> json) => _$MyListStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MyListStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Recommendation {
  AnimeListNode node;
  int numRecommendations;

  Recommendation({
    required this.node,
    required this.numRecommendations,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RelatedAnime {
  AnimeListNode node;
  String relationType;
  String relationTypeFormatted;

  RelatedAnime({
    required this.node,
    required this.relationType,
    required this.relationTypeFormatted,
  });

  factory RelatedAnime.fromJson(Map<String, dynamic> json) => _$RelatedAnimeFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedAnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StartSeason {
  int year;
  String season;

  StartSeason({
    required this.year,
    required this.season,
  });

  factory StartSeason.fromJson(Map<String, dynamic> json) => _$StartSeasonFromJson(json);

  Map<String, dynamic> toJson() => _$StartSeasonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Statistics {
  Status status;
  int numListUsers;

  Statistics({
    required this.status,
    required this.numListUsers,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Status {
  String watching;
  String completed;
  String onHold;
  String dropped;
  String planToWatch;

  Status({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

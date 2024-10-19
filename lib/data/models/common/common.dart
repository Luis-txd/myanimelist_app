import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';
part 'common.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeNode {
  AnimeNode({
    required this.id,
    required this.title,
  });

  factory AnimeNode.fromJson(Map<String, dynamic> json) => _$AnimeNodeFromJson(json);
  int id;
  String title;
  MainPicture? main_picture;
  AnimeAlternativeTitles? alternative_titles;
  String? start_date;
  String? end_date;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  int? num_list_users;
  int? num_scoring_users;
  String? nsfw;
  List<AnimeGenre>? genres;
  DateTime? created_at;
  DateTime? updated_at;
  String? media_type;
  String? status;
  UserMyListStatus? my_list_status;
  int? num_episodes;
  AnimeSeason? start_season;
  AnimeBroadcast? broadcast;
  String? source;
  int? average_episode_duration;
  String? rating;
  List<AnimeStudio>? studios;

  Map<String, dynamic> toJson() => _$AnimeNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeStudio {
  AnimeStudio({required this.id, required this.name});

  factory AnimeStudio.fromJson(Map<String, dynamic> json) => _$AnimeStudioFromJson(json);
  int id;
  String name;
  Map<String, dynamic> toJson() => _$AnimeStudioToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeGenre {
  AnimeGenre({required this.id, required this.name});

  factory AnimeGenre.fromJson(Map<String, dynamic> json) => _$AnimeGenreFromJson(json);
  int id;
  String name;
  Map<String, dynamic> toJson() => _$AnimeGenreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeBroadcast {
  AnimeBroadcast({this.start_time, required this.day_of_the_week});

  factory AnimeBroadcast.fromJson(Map<String, dynamic> json) => _$AnimeBroadcastFromJson(json);
  String? start_time;
  String day_of_the_week;
  Map<String, dynamic> toJson() => _$AnimeBroadcastToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeSeason {
  AnimeSeason({required this.year, required this.season});

  factory AnimeSeason.fromJson(Map<String, dynamic> json) => _$AnimeSeasonFromJson(json);
  int year;
  String season;
  Map<String, dynamic> toJson() => _$AnimeSeasonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeAlternativeTitles {
  AnimeAlternativeTitles({this.en, this.ja, this.synonyms});

  factory AnimeAlternativeTitles.fromJson(Map<String, dynamic> json) => _$AnimeAlternativeTitlesFromJson(json);
  String? en;
  String? ja;
  List<String>? synonyms;
  Map<String, dynamic> toJson() => _$AnimeAlternativeTitlesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MainPicture {
  MainPicture({
    required this.medium,
    this.large,
  });

  factory MainPicture.fromJson(Map<String, dynamic> json) => _$MainPictureFromJson(json);
  String medium;
  String? large;

  Map<String, dynamic> toJson() => _$MainPictureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimePaging {
  AnimePaging({
    required this.next,
  });

  factory AnimePaging.fromJson(Map<String, dynamic> json) => _$AnimePagingFromJson(json);
  String next;

  Map<String, dynamic> toJson() => _$AnimePagingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeData {
  AnimeData({
    required this.node,
  });
  factory AnimeData.fromJson(Map<String, dynamic> json) => _$AnimeDataFromJson(json);
  AnimeNode node;

  Map<String, dynamic> toJson() => _$AnimeDataToJson(this);
}

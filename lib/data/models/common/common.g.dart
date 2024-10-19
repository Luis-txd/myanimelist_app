// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeNode _$AnimeNodeFromJson(Map<String, dynamic> json) => AnimeNode(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    )
      ..main_picture = json['main_picture'] == null
          ? null
          : MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>)
      ..alternative_titles = json['alternative_titles'] == null
          ? null
          : AnimeAlternativeTitles.fromJson(
              json['alternative_titles'] as Map<String, dynamic>)
      ..start_date = json['start_date'] as String?
      ..end_date = json['end_date'] as String?
      ..synopsis = json['synopsis'] as String?
      ..mean = (json['mean'] as num?)?.toDouble()
      ..rank = (json['rank'] as num?)?.toInt()
      ..popularity = (json['popularity'] as num?)?.toInt()
      ..num_list_users = (json['num_list_users'] as num?)?.toInt()
      ..num_scoring_users = (json['num_scoring_users'] as num?)?.toInt()
      ..nsfw = json['nsfw'] as String?
      ..genres = (json['genres'] as List<dynamic>?)
          ?.map((e) => AnimeGenre.fromJson(e as Map<String, dynamic>))
          .toList()
      ..created_at = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..updated_at = json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String)
      ..media_type = json['media_type'] as String?
      ..status = json['status'] as String?
      ..my_list_status = json['my_list_status'] == null
          ? null
          : UserMyListStatus.fromJson(
              json['my_list_status'] as Map<String, dynamic>)
      ..num_episodes = (json['num_episodes'] as num?)?.toInt()
      ..start_season = json['start_season'] == null
          ? null
          : AnimeSeason.fromJson(json['start_season'] as Map<String, dynamic>)
      ..broadcast = json['broadcast'] == null
          ? null
          : AnimeBroadcast.fromJson(json['broadcast'] as Map<String, dynamic>)
      ..source = json['source'] as String?
      ..average_episode_duration =
          (json['average_episode_duration'] as num?)?.toInt()
      ..rating = json['rating'] as String?
      ..studios = (json['studios'] as List<dynamic>?)
          ?.map((e) => AnimeStudio.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AnimeNodeToJson(AnimeNode instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.main_picture?.toJson(),
      'alternative_titles': instance.alternative_titles?.toJson(),
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'synopsis': instance.synopsis,
      'mean': instance.mean,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'num_list_users': instance.num_list_users,
      'num_scoring_users': instance.num_scoring_users,
      'nsfw': instance.nsfw,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'media_type': instance.media_type,
      'status': instance.status,
      'my_list_status': instance.my_list_status?.toJson(),
      'num_episodes': instance.num_episodes,
      'start_season': instance.start_season?.toJson(),
      'broadcast': instance.broadcast?.toJson(),
      'source': instance.source,
      'average_episode_duration': instance.average_episode_duration,
      'rating': instance.rating,
      'studios': instance.studios?.map((e) => e.toJson()).toList(),
    };

AnimeStudio _$AnimeStudioFromJson(Map<String, dynamic> json) => AnimeStudio(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnimeStudioToJson(AnimeStudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AnimeGenre _$AnimeGenreFromJson(Map<String, dynamic> json) => AnimeGenre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnimeGenreToJson(AnimeGenre instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AnimeBroadcast _$AnimeBroadcastFromJson(Map<String, dynamic> json) =>
    AnimeBroadcast(
      start_time: json['start_time'] as String?,
      day_of_the_week: json['day_of_the_week'] as String,
    );

Map<String, dynamic> _$AnimeBroadcastToJson(AnimeBroadcast instance) =>
    <String, dynamic>{
      'start_time': instance.start_time,
      'day_of_the_week': instance.day_of_the_week,
    };

AnimeSeason _$AnimeSeasonFromJson(Map<String, dynamic> json) => AnimeSeason(
      year: (json['year'] as num).toInt(),
      season: json['season'] as String,
    );

Map<String, dynamic> _$AnimeSeasonToJson(AnimeSeason instance) =>
    <String, dynamic>{
      'year': instance.year,
      'season': instance.season,
    };

AnimeAlternativeTitles _$AnimeAlternativeTitlesFromJson(
        Map<String, dynamic> json) =>
    AnimeAlternativeTitles(
      en: json['en'] as String?,
      ja: json['ja'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AnimeAlternativeTitlesToJson(
        AnimeAlternativeTitles instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ja': instance.ja,
      'synonyms': instance.synonyms,
    };

MainPicture _$MainPictureFromJson(Map<String, dynamic> json) => MainPicture(
      medium: json['medium'] as String,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$MainPictureToJson(MainPicture instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'large': instance.large,
    };

AnimePaging _$AnimePagingFromJson(Map<String, dynamic> json) => AnimePaging(
      next: json['next'] as String,
    );

Map<String, dynamic> _$AnimePagingToJson(AnimePaging instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

AnimeData _$AnimeDataFromJson(Map<String, dynamic> json) => AnimeData(
      node: AnimeNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDataToJson(AnimeData instance) => <String, dynamic>{
      'node': instance.node.toJson(),
    };

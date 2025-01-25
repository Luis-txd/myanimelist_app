// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: json['id'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

UserMyListStatus _$UserMyListStatusFromJson(Map<String, dynamic> json) =>
    UserMyListStatus(
      score: (json['score'] as num).toInt(),
      num_episodes_watched: (json['num_episodes_watched'] as num).toInt(),
      is_rewatching: json['is_rewatching'] as bool,
      priority: (json['priority'] as num).toInt(),
      num_times_rewatched: (json['num_times_rewatched'] as num).toInt(),
      rewatch_value: (json['rewatch_value'] as num).toInt(),
      comments: json['comments'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      updated_at: DateTime.parse(json['updated_at'] as String),
    )
      ..status = json['status'] as String?
      ..start_date = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..finish_date = json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String);

Map<String, dynamic> _$UserMyListStatusToJson(UserMyListStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'score': instance.score,
      'num_episodes_watched': instance.num_episodes_watched,
      'is_rewatching': instance.is_rewatching,
      'start_date': instance.start_date?.toIso8601String(),
      'finish_date': instance.finish_date?.toIso8601String(),
      'priority': instance.priority,
      'num_times_rewatched': instance.num_times_rewatched,
      'rewatch_value': instance.rewatch_value,
      'comments': instance.comments,
      'tags': instance.tags,
      'updated_at': instance.updated_at.toIso8601String(),
    };

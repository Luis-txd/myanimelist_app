// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListNode _$AnimeListNodeFromJson(Map<String, dynamic> json) => AnimeListNode(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      main_picture: MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeListNodeToJson(AnimeListNode instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.main_picture.toJson(),
    };

MainPicture _$MainPictureFromJson(Map<String, dynamic> json) => MainPicture(
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$MainPictureToJson(MainPicture instance) => <String, dynamic>{
      'medium': instance.medium,
      'large': instance.large,
    };

AnimePaging _$AnimePagingFromJson(Map<String, dynamic> json) => AnimePaging(
      next: json['next'] as String,
    );

Map<String, dynamic> _$AnimePagingToJson(AnimePaging instance) => <String, dynamic>{
      'next': instance.next,
    };

AnimeData _$AnimeDataFromJson(Map<String, dynamic> json) => AnimeData(
      node: AnimeListNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDataToJson(AnimeData instance) => <String, dynamic>{
      'node': instance.node.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListNode _$AnimeListNodeFromJson(Map<String, dynamic> json) => AnimeListNode(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      mainPicture: MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeListNodeToJson(AnimeListNode instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainPicture': instance.mainPicture.toJson(),
    };

MainPicture _$MainPictureFromJson(Map<String, dynamic> json) => MainPicture(
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$MainPictureToJson(MainPicture instance) => <String, dynamic>{
      'medium': instance.medium,
      'large': instance.large,
    };

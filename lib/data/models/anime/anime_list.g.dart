// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListModel _$AnimeListModelFromJson(Map<String, dynamic> json) => AnimeListModel(
      data: (json['data'] as List<dynamic>).map((e) => AnimeListData.fromJson(e as Map<String, dynamic>)).toList(),
      paging: AnimeListPaging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeListModelToJson(AnimeListModel instance) => <String, dynamic>{
      'data': instance.data.map((AnimeListData e) => e.toJson()).toList(),
      'paging': instance.paging.toJson(),
    };

AnimeListData _$AnimeListDataFromJson(Map<String, dynamic> json) => AnimeListData(
      node: AnimeListNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeListDataToJson(AnimeListData instance) => <String, dynamic>{
      'node': instance.node.toJson(),
    };

AnimeListPaging _$AnimeListPagingFromJson(Map<String, dynamic> json) => AnimeListPaging(
      next: json['next'] as String,
    );

Map<String, dynamic> _$AnimeListPagingToJson(AnimeListPaging instance) => <String, dynamic>{
      'next': instance.next,
    };

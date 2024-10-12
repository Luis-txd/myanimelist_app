import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';
part 'anime_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeListModel {
  AnimeListModel({
    required this.data,
    required this.paging,
  });

  factory AnimeListModel.fromJson(Map<String, dynamic> json) => _$AnimeListModelFromJson(json);
  List<AnimeListData> data;
  AnimeListPaging paging;

  Map<String, dynamic> toJson() => _$AnimeListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListData {
  AnimeListData({
    required this.node,
  });

  factory AnimeListData.fromJson(Map<String, dynamic> json) => _$AnimeListDataFromJson(json);
  AnimeListNode node;

  Map<String, dynamic> toJson() => _$AnimeListDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListPaging {
  AnimeListPaging({
    required this.next,
  });

  factory AnimeListPaging.fromJson(Map<String, dynamic> json) => _$AnimeListPagingFromJson(json);
  String next;

  Map<String, dynamic> toJson() => _$AnimeListPagingToJson(this);
}

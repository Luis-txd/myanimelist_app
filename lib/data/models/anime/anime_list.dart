import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';
part 'anime_list.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeListModel {
  List<AnimeListData> data;
  AnimeListPaging paging;

  AnimeListModel({
    required this.data,
    required this.paging,
  });

  factory AnimeListModel.fromJson(Map<String, dynamic> json) => _$AnimeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListData {
  AnimeListNode node;

  AnimeListData({
    required this.node,
  });

  factory AnimeListData.fromJson(Map<String, dynamic> json) => _$AnimeListDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListPaging {
  String next;

  AnimeListPaging({
    required this.next,
  });

  factory AnimeListPaging.fromJson(Map<String, dynamic> json) => _$AnimeListPagingFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListPagingToJson(this);
}

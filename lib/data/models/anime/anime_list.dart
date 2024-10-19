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
  AnimePaging paging;

  Map<String, dynamic> toJson() => _$AnimeListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListData extends AnimeData {
  AnimeListData({required super.node});

  @override
  factory AnimeListData.fromJson(Map<String, dynamic> json) => _$AnimeListDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AnimeListDataToJson(this);
}

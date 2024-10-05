import 'package:json_annotation/json_annotation.dart';
part 'list.g.dart';

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
class AnimeListNode {
  int id;
  String title;
  AnimeListMainPicture mainPicture;

  AnimeListNode({
    required this.id,
    required this.title,
    required this.mainPicture,
  });

  factory AnimeListNode.fromJson(Map<String, dynamic> json) => _$AnimeListNodeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeListMainPicture {
  String medium;
  String large;

  AnimeListMainPicture({
    required this.medium,
    required this.large,
  });

  factory AnimeListMainPicture.fromJson(Map<String, dynamic> json) => _$AnimeListMainPictureFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListMainPictureToJson(this);
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

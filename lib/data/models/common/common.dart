import 'package:json_annotation/json_annotation.dart';
part 'common.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeListNode {
  AnimeListNode({
    required this.id,
    required this.title,
    required this.main_picture,
  });

  factory AnimeListNode.fromJson(Map<String, dynamic> json) => _$AnimeListNodeFromJson(json);
  int id;
  String title;
  MainPicture main_picture;

  Map<String, dynamic> toJson() => _$AnimeListNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MainPicture {
  MainPicture({
    required this.medium,
    required this.large,
  });

  factory MainPicture.fromJson(Map<String, dynamic> json) => _$MainPictureFromJson(json);
  String medium;
  String large;

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
  AnimeListNode node;

  Map<String, dynamic> toJson() => _$AnimeDataToJson(this);
}

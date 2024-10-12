import 'package:json_annotation/json_annotation.dart';
part 'common.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeListNode {
  AnimeListNode({
    required this.id,
    required this.title,
    required this.mainPicture,
  });

  factory AnimeListNode.fromJson(Map<String, dynamic> json) => _$AnimeListNodeFromJson(json);
  int id;
  String title;
  MainPicture mainPicture;

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

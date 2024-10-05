import 'package:json_annotation/json_annotation.dart';
part 'common.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeListNode {
  int id;
  String title;
  MainPicture mainPicture;

  AnimeListNode({
    required this.id,
    required this.title,
    required this.mainPicture,
  });

  factory AnimeListNode.fromJson(Map<String, dynamic> json) => _$AnimeListNodeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListNodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MainPicture {
  String medium;
  String large;

  MainPicture({
    required this.medium,
    required this.large,
  });

  factory MainPicture.fromJson(Map<String, dynamic> json) => _$MainPictureFromJson(json);

  Map<String, dynamic> toJson() => _$MainPictureToJson(this);
}

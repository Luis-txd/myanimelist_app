import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetail {
  UserDetail({
    required this.id,
    required this.username,
    required this.name,
    required this.photoUrl,
    required this.createdAt,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);

  String id;
  String name;
  String username;
  String photoUrl;
  DateTime createdAt;

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}

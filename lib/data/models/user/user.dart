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

@JsonSerializable(explicitToJson: true)
class UserMyListStatus {
  UserMyListStatus({
    required this.score,
    required this.num_episodes_watched,
    required this.is_rewatching,
    required this.priority,
    required this.num_times_rewatched,
    required this.rewatch_value,
    required this.comments,
    required this.tags,
    required this.updated_at,
  });

  factory UserMyListStatus.fromJson(Map<String, dynamic> json) => _$UserMyListStatusFromJson(json);

  String? status;
  int score;
  int num_episodes_watched;
  bool is_rewatching;
  DateTime? start_date;
  DateTime? finish_date;
  int priority;
  int num_times_rewatched;
  int rewatch_value;
  String comments;
  List<String> tags;
  DateTime updated_at;

  Map<String, dynamic> toJson() => _$UserMyListStatusToJson(this);
}

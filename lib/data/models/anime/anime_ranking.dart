import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';

part 'anime_ranking.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeRankingModel {
  AnimeRankingModel({
    required this.data,
    required this.paging,
  });

  factory AnimeRankingModel.fromJson(Map<String, dynamic> json) => _$AnimeRankingModelFromJson(json);
  List<AnimeRankingData> data;
  AnimePaging paging;

  Map<String, dynamic> toJson() => _$AnimeRankingModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeRankingData extends AnimeData {
  AnimeRankingData({
    required super.node,
    required this.ranking,
  });

  @override
  factory AnimeRankingData.fromJson(Map<String, dynamic> json) => _$AnimeRankingDataFromJson(json);
  AnimeRanking ranking;

  @override
  Map<String, dynamic> toJson() => _$AnimeRankingDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeRanking {
  AnimeRanking({
    required this.rank,
  });

  factory AnimeRanking.fromJson(Map<String, dynamic> json) => _$AnimeRankingFromJson(json);
  int rank;

  Map<String, dynamic> toJson() => _$AnimeRankingToJson(this);
}

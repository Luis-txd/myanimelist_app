import 'package:json_annotation/json_annotation.dart';

import '../common/common.dart';

part 'anime_seasonal.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeSeasonalModel {
  AnimeSeasonalModel({
    required this.data,
    required this.paging,
    required this.season,
  });

  factory AnimeSeasonalModel.fromJson(Map<String, dynamic> json) => _$AnimeSeasonalModelFromJson(json);

  List<AnimeSeasonalData> data;
  AnimePaging paging;
  AnimeSeason season;

  Map<String, dynamic> toJson() => _$AnimeSeasonalModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeSeasonalData extends AnimeData {
  AnimeSeasonalData({required super.node});

  @override
  factory AnimeSeasonalData.fromJson(Map<String, dynamic> json) => _$AnimeSeasonalDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AnimeSeasonalDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeSeason {
  AnimeSeason({
    required this.year,
    required this.season,
  });

  @override
  factory AnimeSeason.fromJson(Map<String, dynamic> json) => _$AnimeSeasonFromJson(json);

  int year;
  String season;

  @override
  Map<String, dynamic> toJson() => _$AnimeSeasonToJson(this);
}

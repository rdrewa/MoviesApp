import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey(name: 'aspect_ratio')
  final double aspectRatio;
  final int height;
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  @JsonKey(name: 'file_path')
  final String filePath;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final int width;

  Picture({
    required this.aspectRatio,
    required this.height,
    this.iso,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Picture.fromJson(Map<String, dynamic> data) => _$PictureFromJson(data);

  Map<String, dynamic> toJson() => _$PictureToJson(this);

}
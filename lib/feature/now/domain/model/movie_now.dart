import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/util/movie_util.dart';
import 'pictures.dart';

part 'movie_now.g.dart';

@JsonSerializable()
class MovieNow {
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title', readValue: MovieUtil.readOriginalTitle)
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(
      name: 'release_date',
      readValue: MovieUtil.readReleaseDate,
      fromJson: MovieUtil.parseReleasedDate)
  final DateTime? releaseDate;
  @JsonKey(readValue: MovieUtil.readTitle)
  final String title;
  @JsonKey(defaultValue: false)
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'images')
  final Pictures pictures;

  const MovieNow(
      {required this.adult,
      this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      this.posterPath,
      this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.pictures});

  factory MovieNow.fromJson(Map<String, dynamic> data) => _$MovieNowFromJson(data);

  Map<String, dynamic> toJson() => _$MovieNowToJson(this);
}

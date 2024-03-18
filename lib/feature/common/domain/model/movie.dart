import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title', readValue: _readOriginalTitle)
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date', readValue: _readReleaseDate)
  final DateTime releaseDate;
  @JsonKey(readValue: _readTitle)
  final String title;
  @JsonKey(defaultValue: false)
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const Movie(
      {required this.adult,
      this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [id];

  static Object _readOriginalTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['original_name'] ?? '');

  static Object _readReleaseDate(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['first_air_date'] ?? '');

  static Object _readTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['name'] ?? '');
}

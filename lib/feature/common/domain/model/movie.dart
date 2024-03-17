import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  @JsonKey(readValue: _readOriginalTitle)
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  @JsonKey(readValue: _readReleaseDate)
  final DateTime releaseDate;
  @JsonKey(readValue: _readTitle)
  final String title;
  final bool video;
  final double voteAverage;
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

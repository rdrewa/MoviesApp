import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../details/domain/model/movie_details.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Movie extends Equatable {
  @HiveField(1)
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @HiveField(0)
  final int id;
  @HiveField(2)
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @HiveField(3)
  @JsonKey(name: 'original_title', readValue: _readOriginalTitle)
  final String originalTitle;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final double popularity;
  @HiveField(6)
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @HiveField(7)
  @JsonKey(name: 'release_date', readValue: _readReleaseDate)
  final DateTime releaseDate;
  @HiveField(8)
  @JsonKey(readValue: _readTitle)
  final String title;
  @HiveField(9)
  @JsonKey(defaultValue: false)
  final bool video;
  @HiveField(10)
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @HiveField(11)
  @JsonKey(name: 'vote_count')
  final int voteCount;

  static const String table = 'watch';

  const Movie(
      {required this.adult,
      this.backdropPath,
      this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromDetails(MovieDetails details) => Movie(
      adult: details.adult,
      backdropPath: details.backdropPath,
      genreIds: details.genreIds,
      id: details.id,
      originalLanguage: details.originalLanguage,
      originalTitle: details.originalTitle,
      overview: details.overview,
      popularity: details.popularity,
      posterPath: details.posterPath,
      releaseDate: details.releaseDate,
      title: details.title,
      video: details.video,
      voteAverage: details.voteAverage,
      voteCount: details.voteCount);

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        genreIds,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];

  int get key => id;

  static Object _readOriginalTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['original_name'] ?? '');

  static Object _readReleaseDate(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['first_air_date'] ?? '');

  static Object _readTitle(Map<dynamic, dynamic> map, String key) =>
      map[key] ?? (map['name'] ?? '');
}

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/domain/model/skyscraper_data.dart';
import '../../../details/domain/model/movie_details.dart';
import '../../util/movie_util.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Movie extends Equatable implements SkyscraperData {
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
  @JsonKey(name: 'original_title', readValue: MovieUtil.readOriginalTitle)
  final String originalTitle;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final double popularity;
  @HiveField(6)
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @HiveField(7)
  @JsonKey(
      name: 'release_date',
      readValue: MovieUtil.readReleaseDate,
      fromJson: MovieUtil.parseReleasedDate)
  final DateTime? releaseDate;
  @HiveField(8)
  @JsonKey(readValue: MovieUtil.readTitle)
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
      this.releaseDate,
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

  @override
  bool? get stringify => true;

  int get key => id;

  @JsonKey(includeFromJson: false)
  @override
  int get identifier => id;

  @JsonKey(includeFromJson: false)
  @override
  bool get hasVote => true;

  @JsonKey(includeFromJson: false)
  @override
  String? get imageUrl => posterPath;

  @JsonKey(includeFromJson: false)
  @override
  String get label => title;

  @JsonKey(includeFromJson: false)
  @override
  double get vote => voteAverage;

  @override
  set identifier(int _) {}

  @override
  set hasVote(bool _) {}

  @override
  set imageUrl(String? _) {}

  @override
  set label(String _) {}

  @override
  set vote(double _) {}
}

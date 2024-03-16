import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'media_type.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final MediaType mediaType;
  final List<int>? genreIds;
  final double popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? name;
  final String? originalName;
  final DateTime? firstAirDate;
  final List<String>? originCountry;
  final int? gender;
  final String? knownForDepartment;
  final dynamic profilePath;
  final List<Movie>? knownFor;

  const Movie(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.name,
      required this.originalName,
      required this.firstAirDate,
      required this.originCountry,
      required this.gender,
      required this.knownForDepartment,
      required this.profilePath,
      required this.knownFor});

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        title,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        mediaType,
        popularity,
        releaseDate,
        video,
        voteAverage,
        voteCount,
        name,
        originalName,
        firstAirDate,
        originCountry,
        gender,
        knownForDepartment,
        profilePath,
        knownFor
      ];
}

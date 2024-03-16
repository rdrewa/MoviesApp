import 'package:json_annotation/json_annotation.dart';

import 'media_type.dart';



@JsonSerializable()
class Movie {
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

  Movie(
      this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.name,
      this.originalName,
      this.firstAirDate,
      this.originCountry,
      this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.knownFor);
}

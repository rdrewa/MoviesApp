import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/feature/details/data/model/review_response.dart';

import '../../../common/data/model/movie_response.dart';
import '../../../common/domain/model/movie.dart';
import '../../../common/util/movie_util.dart';
import 'cast.dart';
import 'credits.dart';
import 'genre.dart';
import 'review.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails extends Equatable {
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
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

  final List<Genre> genres;
  final Credits credits;
  @JsonKey(name: 'reviews')
  final ReviewResponse reviewsData;
  @JsonKey(name: 'similar')
  final MovieResponse similarData;

  const MovieDetails(
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
      required this.voteCount,
      required this.genres,
      required this.credits,
      required this.reviewsData,
      required this.similarData});

  factory MovieDetails.fromJson(Map<String, dynamic> data) =>
      _$MovieDetailsFromJson(data);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);

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
        voteCount,
        genres,
        credits,
        reviewsData,
        similarData
      ];

  List<Cast> get cast => credits.cast;

  List<Review> get reviews => reviewsData.results;

  List<Movie> get similar => similarData.results;
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse extends Equatable {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const MovieResponse(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory MovieResponse.fromJson(Map<String, dynamic> data) =>
      _$MovieResponseFromJson(data);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/movie.dart';

@JsonSerializable()
class Response {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  Response(this.page, this.results, this.totalPages, this.totalResults);
}

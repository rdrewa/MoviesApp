import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/movie.dart';

part 'response.g.dart';

@JsonSerializable()
class Response extends Equatable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const Response(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory Response.fromJson(Map<String, dynamic> data) =>
      _$ResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

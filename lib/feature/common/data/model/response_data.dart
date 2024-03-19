import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/movie.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData extends Equatable {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const ResponseData(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory ResponseData.fromJson(Map<String, dynamic> data) =>
      _$ResponseDataFromJson(data);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

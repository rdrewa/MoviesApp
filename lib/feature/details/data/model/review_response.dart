import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/review.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse extends Equatable {
  final int page;
  final List<Review> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const ReviewResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults});

  factory ReviewResponse.fromJson(Map<String, dynamic> data) =>
      _$ReviewResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

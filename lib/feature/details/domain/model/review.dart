import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_details.dart';

part 'review.g.dart';

@JsonSerializable()
class Review extends Equatable {
  final String author;
  @JsonKey(name: 'author_details')
  final AuthorDetails authorDetails;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String id;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final String url;

  const Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Review.fromJson(Map<String, dynamic> data) => _$ReviewFromJson(data);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  List<Object?> get props =>
      [author, authorDetails, content, createdAt, id, updatedAt, url];
}

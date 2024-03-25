import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_details.g.dart';

@JsonSerializable()
class AuthorDetails extends Equatable {
  final String name;
  final String username;
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  final double? rating;

  const AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> data) =>
      _$AuthorDetailsFromJson(data);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);

  @override
  List<Object?> get props => [name, username, avatarPath, rating];
}

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/domain/model/skyscraper_data.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast extends Equatable implements SkyscraperData {
  final bool adult;
  final int gender;
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> data) => _$CastFromJson(data);

  Map<String, dynamic> toJson() => _$CastToJson(this);

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
        department,
        job
      ];

  @JsonKey(includeFromJson: false)
  @override
  int get identifier => id;

  @JsonKey(includeFromJson: false)
  @override
  bool get hasVote => false;

  @JsonKey(includeFromJson: false)
  @override
  String? get imageUrl => profilePath;

  @JsonKey(includeFromJson: false)
  @override
  String get label => name;

  @JsonKey(includeFromJson: false)
  @override
  double get vote => 0.0;

  @override
  set identifier(int _) {}

  @override
  set hasVote(bool _) {}

  @override
  set imageUrl(String? _) {}

  @override
  set label(String _) {}

  @override
  set vote(double _) {}
}

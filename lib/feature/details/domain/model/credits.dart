import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cast.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits extends Equatable {
  final List<Cast> cast;
  final List<Cast> crew;

  const Credits({
    required this.cast,
    required this.crew,
  });

  factory Credits.fromJson(Map<String, dynamic> data) =>
      _$CreditsFromJson(data);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);

  @override
  List<Object?> get props => [cast, crew];
}

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'picture.dart';

part 'pictures.g.dart';

@JsonSerializable()
class Pictures extends Equatable {
  final List<Picture> backdrops;
  final List<Picture> logos;
  final List<Picture> posters;

  const Pictures({
    required this.backdrops,
    required this.logos,
    required this.posters,
  });

  factory Pictures.fromJson(Map<String, dynamic> data) =>
      _$PicturesFromJson(data);

  Map<String, dynamic> toJson() => _$PicturesToJson(this);

  @override
  List<Object?> get props => [backdrops, logos, posters];
}

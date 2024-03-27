import 'package:freezed_annotation/freezed_annotation.dart';

import 'picture.dart';

part 'pictures.g.dart';

@JsonSerializable()
class Pictures {
  final List<Picture> backdrops;
  final List<Picture> logos;
  final List<Picture> posters;

  Pictures({
    required this.backdrops,
    required this.logos,
    required this.posters,
  });

  factory Pictures.fromJson(Map<String, dynamic> data) => _$PicturesFromJson(data);

  Map<String, dynamic> toJson() => _$PicturesToJson(this);
}
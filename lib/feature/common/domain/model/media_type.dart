import 'package:json_annotation/json_annotation.dart';

enum MediaType {
  @JsonValue('MOVIE')
  movie,
  @JsonValue('PERSON')
  person,
  @JsonValue('TV')
  tv
}
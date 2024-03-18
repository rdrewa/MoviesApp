import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/common/domain/model/movie.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should be a class of Movie', () async {
    // assert
    expect(testMovie1, isA<Movie>());
  });

  test(
      'Should return a valid model from JSON (title, original_title, released_date)',
      () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('movie_1'));

    // act
    final result = Movie.fromJson(jsonMap);

    // assert
    expect(result, equals(testMovie1));
  });

  test(
      'Should return a valid model from JSON (name, original_name, first_air_date)',
      () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('movie_2'));

    // act
    final result = Movie.fromJson(jsonMap);

    // assert
    expect(result, equals(testMovie2));
  });

  test(
      'Should return a valid model list from JSON (mix: title|name, original_title|original_name , release_date|first_air_date)',
      () async {
    // arrange
    final List<dynamic> jsonListOfMap = json.decode(fixture('movies'));

    // act
    final List<Movie> result = [];
    for (Map<String, dynamic> map in jsonListOfMap) {
      result.add(Movie.fromJson(map));
    }

    // assert
    expect(result, equals(testMovies));
  });
}

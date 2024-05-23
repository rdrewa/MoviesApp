import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/core/extension/date_time_format_extension.dart';

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

  test('Should return a valid JSON map from object', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('movie_1'));

    // act
    final Map<String, dynamic> result = testMovie1.toJson();
    result['release_date'] = DateTime.parse(result['release_date']).dashDate;

    // assert
    expect(result, equals(jsonMap));
  });

  test('Should return a valid model from MovieDetails', () async {
    // arrange: from data.dart

    // act
    final result = Movie.fromDetails(testMovieDetails);

    // assert
    expect(result, isA<Movie>());
    expect(result.id, testMovieDetails.id);
    expect(result.adult, testMovieDetails.adult);
    expect(result.originalLanguage, testMovieDetails.originalLanguage);
    expect(result.originalTitle, testMovieDetails.originalTitle);
    expect(result.overview, testMovieDetails.overview);
    expect(result.popularity, testMovieDetails.popularity);
    expect(result.releaseDate, testMovieDetails.releaseDate);
    expect(result.title, testMovieDetails.title);
    expect(result.video, testMovieDetails.video);
    expect(result.voteAverage, testMovieDetails.voteAverage);
    expect(result.voteCount, testMovieDetails.voteCount);
  });
}

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/now/domain/model/movie_now.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model MovieNow from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('movie_now'));

    // act
    final result = MovieNow.fromJson(jsonMap);

    // assert
    expect(result, equals(testMovieNow));
  });
}

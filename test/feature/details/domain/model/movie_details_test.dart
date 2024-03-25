import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/details/domain/model/movie_details.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {

  test(
      'Should return a valid model MovieDetails from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('movie_details'));

        // act
        final result = MovieDetails.fromJson(jsonMap);

        // assert
        expect(result, equals(testMovieDetails));
      });
}

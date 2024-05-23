

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/feature/common/data/model/movie_response.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should be a class of MovieResponse', () async {
    // assert
    expect(testMovieResponse1, isA<MovieResponse>());
  });
}
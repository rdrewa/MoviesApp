import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/details/domain/model/genre.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test(
      'Should return a valid model Genre from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('genre'));

        // act
        final result = Genre.fromJson(jsonMap);

        // assert
        expect(result, equals(testGenre1));
      });
}
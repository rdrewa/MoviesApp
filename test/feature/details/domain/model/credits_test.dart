import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/details/domain/model/credits.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test(
      'Should return a valid model Cast from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('credits'));

        // act
        final result = Credits.fromJson(jsonMap);

        // assert
        expect(result, equals(testCredits));
      });
}
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/details/domain/model/cast.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test(
      'Should return a valid model Cast from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('cast'));

        // act
        final result = Cast.fromJson(jsonMap);

        // assert
        expect(result, equals(testCast1));
      });
}
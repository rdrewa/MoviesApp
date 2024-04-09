import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/now/domain/model/picture.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Picture from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('picture'));

    // act
    final result = Picture.fromJson(jsonMap);

    // assert
    expect(result, equals(testPicture1backdrop));
  });
}

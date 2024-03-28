import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/now/domain/model/pictures.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model Pictures from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('pictures'));

    // act
    final result = Pictures.fromJson(jsonMap);

    // assert
    expect(result, equals(testPictures));
  });
}

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/feature/details/domain/model/author_details.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test(
      'Should return a valid model AuthorDetails from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('author_details'));

        // act
        final result = AuthorDetails.fromJson(jsonMap);

        // assert
        expect(result, equals(testAuthorDetails1));
      });
}
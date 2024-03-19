import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

extension MockAdapterStub on MockHttpClientAdapter {
  void mockResponseStub(String body, int statusCode) {
    final response = ResponseBody.fromString(body, statusCode, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType]
    });

    when(() => fetch(any(), any(), any())).thenAnswer((_) async => response);
  }
}

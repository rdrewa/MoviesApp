import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/data/model/response_data.dart';
import 'package:movies_app/feature/common/data/source/remote/movie_service.dart';

import '../../../../../util/data.dart';
import '../../../../../util/fixture.dart';
import '../../../../../util/mock_adapter_stub.dart';
import '../../../../../util/mocks.dart';

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  const apiKey = 'XYZ';
  late MockHttpClientAdapter mockHttpClientAdapter;
  late MovieService movieService;

  setUpAll(() {
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockHttpClientAdapter = MockHttpClientAdapter();
    movieService =
        MovieService(Dio()..httpClientAdapter = mockHttpClientAdapter);
  });

  group('Get movies lists', () {
    test('Should return Trending Movies list when the response code is 200',
        () async {
      // arrange
      mockHttpClientAdapter.mockResponseStub(fixture('movie_response'), 200);

      // act
      final result = await movieService.getTopRatedList(apiKey);

      // assert
      expect(result, isA<ResponseData>());
      expect(result.results, testMovies);
    });

    test('Should return Popular Movies list when the response code is 200',
        () async {
      // arrange
      mockHttpClientAdapter.mockResponseStub(fixture('movie_response'), 200);

      // act
      final result = await movieService.getPopularList(apiKey);

      // assert
      expect(result, isA<ResponseData>());
      expect(result.results, testMovies);
    });

    test('Should return Top Rated Movies list when the response code is 200',
            () async {
          // arrange
          mockHttpClientAdapter.mockResponseStub(fixture('movie_response'), 200);

          // act
          final result = await movieService.getTopRatedList(apiKey);

          // assert
          expect(result, isA<ResponseData>());
          expect(result.results, testMovies);
        });

    test('Should return return a failure when response code is 404 or other',
        () async {
      // arrange
      mockHttpClientAdapter.mockResponseStub('Not found', 404);

      final request = movieService.getTopRatedList;

      // assert
      expect(() => request(apiKey), throwsA(const TypeMatcher<DioException>()));
    });
  });
}

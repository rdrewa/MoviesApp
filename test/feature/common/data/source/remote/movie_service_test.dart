import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/data/model/movie_response.dart';
import 'package:movies_app/feature/common/data/source/remote/movie_service.dart';
import 'package:movies_app/feature/details/domain/model/movie_details.dart';

import '../../../../../util/data.dart';
import '../../../../../util/fixture.dart';
import '../../../../../util/mock_adapter_stub.dart';
import '../../../../../util/mocks.dart';

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
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
      final result = await movieService.getTopRatedList();

      // assert
      expect(result, isA<MovieResponse>());
      expect(result.results, testMovies);
    });

    test('Should return Popular Movies list when the response code is 200',
        () async {
      // arrange
      mockHttpClientAdapter.mockResponseStub(fixture('movie_response'), 200);

      // act
      final result = await movieService.getPopularList();

      // assert
      expect(result, isA<MovieResponse>());
      expect(result.results, testMovies);
    });

    test('Should return Top Rated Movies list when the response code is 200',
            () async {
          // arrange
          mockHttpClientAdapter.mockResponseStub(fixture('movie_response'), 200);

          // act
          final result = await movieService.getTopRatedList();

          // assert
          expect(result, isA<MovieResponse>());
          expect(result.results, testMovies);
        });

    test('Should return return a failure when response code for getting movie list is 404 or other',
        () async {
      // arrange
      mockHttpClientAdapter.mockResponseStub('Not found', 404);

      final request = movieService.getTopRatedList;

      // assert
      expect(() => request(), throwsA(const TypeMatcher<DioException>()));
    });
  });

  group('Get movie details', () {
    const  movieDetailsId = 95;
    test('Should return MovieDetails when the response code is 200',
            () async {
          // arrange
          mockHttpClientAdapter.mockResponseStub(fixture('movie_details'), 200);

          // act
          final result = await movieService.getMovieDetails(movieDetailsId);

          // assert
          expect(result, isA<MovieDetails>());
          expect(result, testMovieDetails);
        });

    test('Should return return a failure when response code for getting movie details is 404 or other',
            () async {
          // arrange
          mockHttpClientAdapter.mockResponseStub('Not found', 404);

          final request = movieService.getMovieDetails;

          // assert
          expect(() => request(movieDetailsId), throwsA(const TypeMatcher<DioException>()));
        });
  });
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/common/data/model/movie_response.dart';
import 'package:movies_app/feature/common/data/repository/movie_rest_repository.dart';
import 'package:movies_app/feature/now/domain/model/movie_now.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  dotenv.testLoad(mergeWith: {'API_URL': 'API-URL', 'API_KEY': 'API-TOKEN'});

  late MockMovieService mockMovieService;
  late MovieRestRepository movieRestRepository;

  final MovieResponse responseData = MovieResponse(
      page: 1,
      results: testMovies,
      totalPages: 1,
      totalResults: testMovies.length);

  setUp(() {
    mockMovieService = MockMovieService();
    movieRestRepository = MovieRestRepository(mockMovieService);
  });

  group('Get movies lists', () {
    test(
        'Should return Trending movies list when call to service is successful',
        () async {
      // arrange
      when(() => mockMovieService.getTrendingList())
          .thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getTrendingList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test(
        'Should return Top Rated movies list when call to service is successful',
        () async {
      // arrange
      when(() => mockMovieService.getTopRatedList())
          .thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getTopRatedList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test(
        'Should return Popular movies list when call to service is successful ',
        () async {
      // arrange
      when(() => mockMovieService.getPopularList())
          .thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getPopularList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test(
        'Should return server failure when a call about Trending Movies to service is unsuccessful',
        () async {
      // arrange
      when(() => mockMovieService.getTrendingList())
          .thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getTrendingList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });

    test(
        'Should return server failure when a call about Top Rated Movies to service is unsuccessful',
        () async {
      // arrange
      when(() => mockMovieService.getTopRatedList())
          .thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getTopRatedList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });

    test(
        'Should return server failure when a call about Popular Movies to service is unsuccessful',
        () async {
      // arrange
      when(() => mockMovieService.getPopularList())
          .thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getPopularList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });
  });

  group('Get movie details', () {
    const movieDetailsId = 95;

    test('Should return MovieDetails when call to service is successful',
        () async {
      // arrange
      when(() => mockMovieService.getMovieDetails(movieDetailsId))
          .thenAnswer((_) async => testMovieDetails);

      // act
      final result = await movieRestRepository.getMovieDetails(movieDetailsId);

      // assert
      expect(result, equals(Right(testMovieDetails)));
    });

    test(
        'Should return server failure when a call about MovieDetails to service is unsuccessful',
        () async {
      // arrange
      when(() => mockMovieService.getMovieDetails(movieDetailsId))
          .thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getMovieDetails(movieDetailsId);

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });
  });

  group('Get movie now', () {
    const movieNowId = 787699;
    test('Should return MovieNow list when call to service is successful',
        () async {
      // arrange
      when(() => mockMovieService.getNowList()).thenAnswer((_) async =>
          MovieResponse(
              page: 1, results: [testMovie3], totalPages: 1, totalResults: 1));
      when(() => mockMovieService.getMovieNow(movieNowId))
          .thenAnswer((_) async => testMovieNow);

      // act
      final Either<Failure, List<MovieNow>> result =
          await movieRestRepository.getNowList();

      // assert
      result.fold((left) => fail('test failed'),
          (right) => expect(right, [testMovieNow]));
    });

    test(
        'Should return server failure when a call about MovieDNow list to service is unsuccessful',
        () async {
      // arrange
      when(() => mockMovieService.getNowList())
          .thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getNowList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });
  });
}

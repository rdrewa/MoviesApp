import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/common/data/model/response_data.dart';
import 'package:movies_app/feature/common/data/repository/movie_rest_repository.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late MockMovieService mockMovieService;
  late MovieRestRepository movieRestRepository;

  final ResponseData responseData = ResponseData(page: 1, results: testMovies, totalPages: 1, totalResults: testMovies.length);

  setUp(() {
    mockMovieService = MockMovieService();
    movieRestRepository = MovieRestRepository(mockMovieService);
  });
  
  group('Get movies lists', () {
    test('Should return Trending movies list when call to service is successful ', () async {
      // arrange
      when(() => mockMovieService.getTrendingList('apiKey')).thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getTrendingList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test('Should return Top Rated movies list when call to service is successful ', () async {
      // arrange
      when(() => mockMovieService.getTopRatedList('apiKey')).thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getTopRatedList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test('Should return Popular movies list when call to service is successful ', () async {
      // arrange
      when(() => mockMovieService.getPopularList('apiKey')).thenAnswer((_) async => responseData);

      // act
      final result = await movieRestRepository.getPopularList();

      // assert
      expect(result, equals(Right(testMovies)));
    });
    
    test('Should return server failure when a call about Trending Movies to service ris unsuccessful', () async {
      // arrange
      when(() => mockMovieService.getTrendingList('apiKey')).thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getTrendingList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });

    test('Should return server failure when a call about Top Rated Movies to service ris unsuccessful', () async {
      // arrange
      when(() => mockMovieService.getTopRatedList('apiKey')).thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getTopRatedList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });

    test('Should return server failure when a call about Popular Movies to service ris unsuccessful', () async {
      // arrange
      when(() => mockMovieService.getPopularList('apiKey')).thenThrow(DioException(requestOptions: RequestOptions()));

      // act
      final result = await movieRestRepository.getPopularList();

      // assert
      expect(result, equals(const Left(ServerFailure('Server Failure'))));
    });
  });
}
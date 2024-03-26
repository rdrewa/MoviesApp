import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/common/data/repository/watch_db_repository.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {

  late MockWatchService mockWatchService;
  late WatchDbRepository watchDbRepository;

  setUp(() {
    mockWatchService = MockWatchService();
    watchDbRepository = WatchDbRepository(mockWatchService);
  });

  const errorMessage = 'Database Failure';

  group('Get watch list', () {
    test('Should return Watch Movies list when call to service is successful', () async {
      // arrange
      when(() => mockWatchService.getList()).thenAnswer((_) async => testMovies);

      // act
      final result = await watchDbRepository.getList();

      // assert
      expect(result, equals(Right(testMovies)));
    });

    test('Should return database failure when call to service is unsuccessful', () async {
      // arrange
      when(() => mockWatchService.getList()).thenThrow(HiveError(errorMessage));

      // act
      final result = await watchDbRepository.getList();

      // assert
      expect(result, equals(const Left(DatabaseFailure(errorMessage))));
    });
  });

}
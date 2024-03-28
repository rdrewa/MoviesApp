import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/watch/domain/usecase/get_watch_list_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final MockWatchRepository mockWatchRepository;
  late final GetWatchListUsecase getWatchListUsecase;

  setUp(() {
    mockWatchRepository = MockWatchRepository();
    getWatchListUsecase = GetWatchListUsecase(mockWatchRepository);
  });

  test('Should get Watch movie list from repository', () async {
    // arrange
    when(() => mockWatchRepository.getList()).thenAnswer((invocation) async => Right(testMovies));

    // act
    final result = await getWatchListUsecase();

    // assert
    expect(result, Right(testMovies));
  });
}
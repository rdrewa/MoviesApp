import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/details/domain/usecase/is_on_watch_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final MockWatchRepository mockWatchRepository;
  late final IsOnWatchUsecase isOnWatchUsecase;

  setUpAll(() {
    mockWatchRepository = MockWatchRepository();
    isOnWatchUsecase = IsOnWatchUsecase(mockWatchRepository);
  });

  test('Should return true when movie is added', () async {
    // arrange
    when(() => mockWatchRepository.isAdded(testMovie1.id))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await isOnWatchUsecase(testMovie1);

    // assert
    expect(result, const Right(true));
  });

  test('Should return false when movie is not added', () async {
    // arrange
    when(() => mockWatchRepository.isAdded(testMovie1.id))
        .thenAnswer((_) async => const Right(false));

    // act
    final result = await isOnWatchUsecase(testMovie1);

    // assert
    expect(result, const Right(false));
  });
}

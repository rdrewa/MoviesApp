import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/feature/details/domain/usecase/add_to_watch_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final MockWatchRepository mockWatchRepository;
  late final AddToWatchUsecase addToWatchUsecase;

  setUp(() {
    mockWatchRepository = MockWatchRepository();
    addToWatchUsecase = AddToWatchUsecase(mockWatchRepository);
  });

  test('Should return void/null after adding item to watch', () async {
    // arrange
    when(() => mockWatchRepository.addItem(testMovie1))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await addToWatchUsecase(testMovie1);

    // assert
    expect(result, const Right(null));
  });
}

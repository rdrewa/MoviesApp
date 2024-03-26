import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/feature/details/domain/usecase/add_to_watch_usecase.dart';
import 'package:movies_app/feature/details/domain/usecase/remove_from_watch_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final MockWatchRepository mockWatchRepository;
  late final RemoveFromWatchUsecase removeFromWatchUsecase;

  setUp(() {
    mockWatchRepository = MockWatchRepository();
    removeFromWatchUsecase = RemoveFromWatchUsecase(mockWatchRepository);
  });

  test('Should return void/null after removing item to watch', () async {
    // arrange
    when(() => mockWatchRepository.removeItem(testMovie1))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await removeFromWatchUsecase(testMovie1);

    // assert
    expect(result, const Right(null));
  });
}

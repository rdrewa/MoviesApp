import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/now/domain/model/movie_now.dart';

import 'package:movies_app/feature/now/domain/usecase/get_now_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final MockMovieRepository mockMovieRepository;
  late final GetNowUsecase getNowUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getNowUsecase = GetNowUsecase(mockMovieRepository);
  });

  test('Should get MovieNow list from repository', () async {
    // arrange
    when(() => mockMovieRepository.getNowList())
        .thenAnswer((invocation) async => Right([testMovieNow]));

    // act
    final Either<Failure, List<MovieNow>> result = await getNowUsecase();

    // assert
    result.fold((left) => fail('test failed'),
        (right) => expect(right, [testMovieNow]));
  });
}

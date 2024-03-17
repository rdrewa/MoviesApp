import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/home/domain/usecase/get_popular_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final GetPopularUsecase getPopularUsecase;
  late final MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getPopularUsecase = GetPopularUsecase(mockMovieRepository);
  });

  test('Should get Popular movies list from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getTrendingList())
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await getPopularUsecase();

    // assert
    expect(result, Right(testMovies));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/home/domain/usecase/get_top_rated_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final GetTopRatedUsecase getTopRatedUsecase;
  late final MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getTopRatedUsecase = GetTopRatedUsecase(mockMovieRepository);
  });

  test('Should get Top Rated movies list from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getTopRatedList())
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await getTopRatedUsecase();

    // assert
    expect(result, Right(testMovies));
  });
}

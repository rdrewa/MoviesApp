import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/feature/details/domain/usecase/get_details_usecase.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late final GetDetailsUsecase getDetailsUsecase;
  late final MockMovieRepository mockMovieRepository;

  const movieDetailsId = 95;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getDetailsUsecase = GetDetailsUsecase(mockMovieRepository);
  });

  test('Should get movies details from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getMovieDetails(movieDetailsId))
        .thenAnswer((_) async => Right(testMovieDetails));

    // act
    final result = await getDetailsUsecase(movieDetailsId);

    // assert
    expect(result, Right(testMovieDetails));
  });
}

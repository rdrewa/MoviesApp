import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/details/presentation/bloc/details/details_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockGetDetailsUsecase mockGetDetailsUsecase;
  late DetailsBloc detailsBloc;

  const movieDetailsId = 95;

  setUp(() {
    mockGetDetailsUsecase = MockGetDetailsUsecase();
    detailsBloc = DetailsBloc(mockGetDetailsUsecase);
  });

  test('Initial state should be initial', () {
    expect(detailsBloc.state, DetailsInitial());
  });

  blocTest<DetailsBloc, DetailsState>(
      'Should emit [DetailsLoading, DetailsLoaded] when data is gotten successfully',
      build: () => detailsBloc,
      setUp: () => when(() => mockGetDetailsUsecase(movieDetailsId))
          .thenAnswer((_) async => Right(testMovieDetails)),
      act: (bloc) => bloc.add(const GetDetailsEvent(movieDetailsId)),
      expect: () => [DetailsLoading(), DetailsLoaded(testMovieDetails)]);

  blocTest<DetailsBloc, DetailsState>(
      'Should emit [DetailsLoading, DetailsFailure] when data is unsuccessful',
      build: () => detailsBloc,
      setUp: () => when(() => mockGetDetailsUsecase(movieDetailsId))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure'))),
      act: (bloc) => bloc.add(const GetDetailsEvent(movieDetailsId)),
      expect: () =>
          [DetailsLoading(), const DetailsFailure('Something went wrong')]);
}

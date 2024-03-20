import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/home/presentation/bloc/popular/popular_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockGetPopularUsecase mockGetPopularUsecase;
  late PopularBloc popularBloc;

  setUp(() {
    mockGetPopularUsecase = MockGetPopularUsecase();
    popularBloc = PopularBloc(mockGetPopularUsecase);
  });

  test('Initial state should be initial', () {
    expect(popularBloc.state, PopularInitial());
  });

  blocTest<PopularBloc, PopularState>(
      'Should emit [PopularLoading, PopularLoaded] when full data is gotten successfully',
      build: () => popularBloc,
      setUp: () => when(() => mockGetPopularUsecase())
          .thenAnswer((_) async => Right(testMovies)),
      act: (bloc) => bloc.add(OnGetPopularEvent()),
      wait: const Duration(microseconds: 500),
      expect: () => [PopularLoading(), PopularLoaded(testMovies)]);

  blocTest<PopularBloc, PopularState>(
      'Should emit [PopularLoading, PopularEmpty] when empty data is gotten successfully',
      build: () => popularBloc,
      setUp: () => when(() => mockGetPopularUsecase())
          .thenAnswer((_) async => const Right([])),
      act: (bloc) => bloc.add(OnGetPopularEvent()),
      wait: const Duration(microseconds: 500),
      expect: () => [PopularLoading(), PopularEmpty()]);

  blocTest<PopularBloc, PopularState>(
      'Should emit [PopularLoading, PopularFailure] when get data is unsuccessful',
      build: () => popularBloc,
      setUp: () => when(() => mockGetPopularUsecase())
          .thenAnswer((_) async => const Left(ServerFailure('Server failure'))),
      act: (bloc) => bloc.add(OnGetPopularEvent()),
      wait: const Duration(microseconds: 500),
      expect: () => [PopularLoading(), const PopularFailure('Something went wrong')]);
}

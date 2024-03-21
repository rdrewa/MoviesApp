import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/home/presentation/bloc/trending/trending_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockGetTrendingUsecase mockGetTrendingUsecase;
  late TrendingBloc trendingBloc;

  setUp(() {
    mockGetTrendingUsecase = MockGetTrendingUsecase();
    trendingBloc = TrendingBloc(mockGetTrendingUsecase);
  });

  test('Initial state should be initial', () {
    expect(trendingBloc.state, TrendingInitial());
  });

  blocTest<TrendingBloc, TrendingState>(
      'Should emit [TrendingLoading, TrendingLoaded] when full data is gotten successfully',
      build: () => trendingBloc,
      setUp: () => when(() => mockGetTrendingUsecase())
          .thenAnswer((_) async => Right(testMovies)),
      act: (bloc) => bloc.add(GetTrendingEvent()),
      expect: () => [TrendingLoading(), TrendingLoaded(testMovies)]);

  blocTest<TrendingBloc, TrendingState>(
      'Should emit [TrendingLoading, TrendingEmpty] when empty data is gotten successfully',
      build: () => trendingBloc,
      setUp: () => when(() => mockGetTrendingUsecase())
          .thenAnswer((_) async => const Right([])),
      act: (bloc) => bloc.add(GetTrendingEvent()),
      expect: () => [TrendingLoading(), TrendingEmpty()]);

  blocTest<TrendingBloc, TrendingState>(
      'Should emit [TrendingLoading, TrendingFailure] when get data is unsuccessful',
      build: () => trendingBloc,
      setUp: () => when(() => mockGetTrendingUsecase())
          .thenAnswer((_) async => const Left(ServerFailure('Server failure'))),
      act: (bloc) => bloc.add(GetTrendingEvent()),
      expect: () => [TrendingLoading(), const TrendingFailure('Something went wrong')]);
}

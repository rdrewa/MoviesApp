import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/home/presentation/bloc/toprated/top_rated_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockGetTopRatedUsecase mockGetTopRatedUsecase;
  late TopRatedBloc topRatedBloc;

  setUp(() {
    mockGetTopRatedUsecase = MockGetTopRatedUsecase();
    topRatedBloc = TopRatedBloc(mockGetTopRatedUsecase);
  });

  test('Initial state should be initial', () {
    expect(topRatedBloc.state, TopRatedInitial());
  });

  blocTest<TopRatedBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedLoaded] when full data is gotten successfully',
      build: () => topRatedBloc,
      setUp: () => when(() => mockGetTopRatedUsecase())
          .thenAnswer((_) async => Right(testMovies)),
      act: (bloc) => bloc.add(OnGetTopRatedEvent()),
      expect: () => [TopRatedLoading(), TopRatedLoaded(testMovies)]);

  blocTest<TopRatedBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedEmpty] when empty data is gotten successfully',
      build: () => topRatedBloc,
      setUp: () => when(() => mockGetTopRatedUsecase())
          .thenAnswer((_) async => const Right([])),
      act: (bloc) => bloc.add(OnGetTopRatedEvent()),
      expect: () => [TopRatedLoading(), TopRatedEmpty()]);

  blocTest<TopRatedBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedFailure] when get data is unsuccessful',
      build: () => topRatedBloc,
      setUp: () => when(() => mockGetTopRatedUsecase())
          .thenAnswer((_) async => const Left(ServerFailure('Server failure'))),
      act: (bloc) => bloc.add(OnGetTopRatedEvent()),
      expect: () => [TopRatedLoading(), const TopRatedFailure('Something went wrong')]);
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/watch/presentation/bloc/list/watch_list_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockGetWatchListUsecase mockGetWatchListUsecase;
  late WatchListBloc watchListBloc;

  setUp(() {
    mockGetWatchListUsecase = MockGetWatchListUsecase();
    watchListBloc = WatchListBloc(mockGetWatchListUsecase);
  });

  test('Initial state should be initial', () {
    expect(watchListBloc.state, WatchListInitial());
  });

  blocTest<WatchListBloc, WatchListState>(
      'Should emit [WatchListLoading, WatchListLoaded] when full data is gotten successfully',
      build: () => watchListBloc,
      setUp: () => when(() => mockGetWatchListUsecase())
          .thenAnswer((_) async => Right(testMovies)),
      act: (bloc) => bloc.add(GetWatchListEvent()),
      expect: () => [WatchListLoading(), WatchListLoaded(testMovies)]);
}

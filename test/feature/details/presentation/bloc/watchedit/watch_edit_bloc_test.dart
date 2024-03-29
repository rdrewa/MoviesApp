import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feature/details/presentation/bloc/watchedit/watch_edit_bloc.dart';

import '../../../../../util/data.dart';
import '../../../../../util/mocks.dart';

void main() {
  late MockAddToWatchUsecase mockAddToWatchUsecase;
  late MockRemoveFromWatchUsecase mockRemoveFromWatchUsecase;
  late MockIsOnWatchUsecase mockIsOnWatchUsecase;
  late WatchEditBloc watchEditBloc;

  const errorMessage = 'Database Error';

  setUp(() {
    mockAddToWatchUsecase = MockAddToWatchUsecase();
    mockRemoveFromWatchUsecase = MockRemoveFromWatchUsecase();
    mockIsOnWatchUsecase = MockIsOnWatchUsecase();
    watchEditBloc = WatchEditBloc(mockIsOnWatchUsecase, mockAddToWatchUsecase,
        mockRemoveFromWatchUsecase);
  });

  test('Initial state should be false', () {
    expect(watchEditBloc.state.isAdded, false);
  });

  group('Adding to watch', () {
    blocTest<WatchEditBloc, WatchEditState>(
        'Should emit [WatchEditState(TRUE)] when added successfully',
        build: () => watchEditBloc,
        setUp: () => when(() => mockAddToWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Right(null)),
        act: (bloc) => bloc.add(AddToListEvent(testMovie1)),
        expect: () => [const WatchEditState(isAdded: true)]);

    blocTest<WatchEditBloc, WatchEditState>(
        'Should not emit a new state when added unsuccessfully',
        build: () => watchEditBloc,
        setUp: () => when(() => mockAddToWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Left(DatabaseFailure(errorMessage))),
        act: (bloc) => bloc.add(AddToListEvent(testMovie1)),
        expect: () => []);
  });

  group('Removing from watch', () {
    blocTest<WatchEditBloc, WatchEditState>(
        'Should emit [WatchEditState(FALSE)] when removing successfully',
        build: () => watchEditBloc,
        setUp: () => when(() => mockRemoveFromWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Right(null)),
        act: (bloc) => bloc.add(RemoveFromListEvent(testMovie1)),
        expect: () => [const WatchEditState(isAdded: false)]);

    blocTest<WatchEditBloc, WatchEditState>(
        'Should not emit a new state when removing unsuccessfully',
        build: () => watchEditBloc,
        setUp: () => when(() => mockRemoveFromWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Left(DatabaseFailure(errorMessage))),
        act: (bloc) => bloc.add(RemoveFromListEvent(testMovie1)),
        expect: () => []);
  });

  group('Is on watch', () {
    blocTest<WatchEditBloc, WatchEditState>(
        'Should emit [WatchEditState(TRUE)] when checking is movie on list is successful',
        build: () => watchEditBloc,
        setUp: () => when(() => mockIsOnWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Right(true)),
        act: (bloc) => bloc.add(IsOnListEvent(testMovie1)),
        expect: () => [const WatchEditState(isAdded: true)]);

    blocTest<WatchEditBloc, WatchEditState>(
        'Should emit [WatchEditState(FALSE)] when checking is movie on list is successful',
        build: () => watchEditBloc,
        setUp: () => when(() => mockIsOnWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Right(false)),
        act: (bloc) => bloc.add(IsOnListEvent(testMovie1)),
        expect: () => [const WatchEditState(isAdded: false)]);

    blocTest<WatchEditBloc, WatchEditState>(
        'Should not emit a new state when when checking is movie on list is unsuccessful',
        build: () => watchEditBloc,
        setUp: () => when(() => mockIsOnWatchUsecase(testMovie1))
            .thenAnswer((_) async => const Left(DatabaseFailure(errorMessage))),
        act: (bloc) => bloc.add(IsOnListEvent(testMovie1)),
        expect: () => []);
  });
}

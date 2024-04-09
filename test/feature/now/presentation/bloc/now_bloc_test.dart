import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/now/presentation/bloc/now/now_bloc.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';

void main() {
  late MockGetNowUsecase mockGetNowUsecase;
  late NowBloc nowBloc;

  setUp(() {
    mockGetNowUsecase = MockGetNowUsecase();
    nowBloc = NowBloc(mockGetNowUsecase);
  });

  test('Initial state should be initial', () {
    expect(nowBloc.state, NowInitial());
  });

  blocTest<NowBloc, NowState>(
      'Should emit [NowLoading, NowLoaded] when full data is gotten successfully',
      build: () => nowBloc,
      setUp: () => when(() => mockGetNowUsecase())
          .thenAnswer((_) async => Right([testMovieNow])),
      act: (bloc) => bloc.add(GetNowEvent()),
      expect: () => [
            NowLoading(),
            NowLoaded([testMovieNow])
          ]);
}

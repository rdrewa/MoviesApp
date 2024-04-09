import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/presentation/widget/empty_box.dart';
import 'package:movies_app/feature/common/presentation/widget/error_box.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';
import 'package:movies_app/feature/now/presentation/bloc/now/now_bloc.dart';
import 'package:movies_app/feature/now/presentation/screen/now_screen.dart';
import 'package:movies_app/feature/now/presentation/widget/carousel_image.dart';
import 'package:movies_app/feature/now/presentation/widget/carousel_pictures.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';
import '../../../../util/tester_app.dart';

void main() {
  late MockNowBloc mockNowBloc;

  setUp(() async {
    mockNowBloc = MockNowBloc();
  });

  final GetIt sl = GetIt.instance;
  sl.registerFactory<NowBloc>(() => mockNowBloc);

  testWidgets('Should not show progress indicator when state is initial',
      (widgetTester) async {
    // arrange
    when(() => mockNowBloc.state).thenReturn(NowInitial());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: NowScreen()));

    // assert
    expect(find.byType(NowScreen), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('Should show progress indicator when state is loading',
      (widgetTester) async {
    // arrange
    when(() => mockNowBloc.state).thenReturn(NowLoading());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: NowScreen()));

    // assert
    expect(find.byType(NowScreen), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(ProgressWheel), findsOneWidget);
  });

  testWidgets('Should show empty box when state is empty',
          (widgetTester) async {
        // arrange
        when(() => mockNowBloc.state).thenReturn(NowEmpty());

        // act
        await widgetTester.pumpWidget(const TesterApp(tested: NowScreen()));

        // assert
        expect(find.byType(NowScreen), findsOneWidget);
        expect(find.byType(EmptyBox), findsOneWidget);
      });

  testWidgets('Should show carousel list and pictures grid when state is loaded',
          (widgetTester) async {
        // arrange
        when(() => mockNowBloc.state).thenReturn(NowLoaded([testMovieNow, testMovieNow, testMovieNow, testMovieNow]));

        // act
        await widgetTester.pumpWidget(const TesterApp(tested: NowScreen()));

        // assert
        expect(find.byType(NowScreen), findsOneWidget);
        expect(find.byType(ProgressWheel), findsNothing);
        expect(find.byType(CarouselImage), findsNWidgets(3));
        expect(find.byType(CarouselPictures), findsNWidgets(3));
      });

  testWidgets('Should show error box when state is failure',
          (widgetTester) async {
        // arrange
        when(() => mockNowBloc.state).thenReturn(const NowFailure('error'));

        // act
        await widgetTester.pumpWidget(const TesterApp(tested: NowScreen()));

        // assert
        expect(find.byType(NowScreen), findsOneWidget);
        expect(find.byType(ErrorBox), findsOneWidget);
      });
}

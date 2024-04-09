import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/presentation/widget/empty_box.dart';
import 'package:movies_app/feature/common/presentation/widget/error_box.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';
import 'package:movies_app/feature/watch/presentation/bloc/list/watch_list_bloc.dart';
import 'package:movies_app/feature/watch/presentation/screen/watch_screen.dart';
import 'package:movies_app/feature/watch/presentation/widget/watch_list_container.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';
import '../../../../util/tester_app.dart';

void main() {
  late MockWatchListBloc mockWatchListBloc;

  setUp(() async {
    mockWatchListBloc = MockWatchListBloc();
  });

  final GetIt sl = GetIt.instance;
  sl.registerFactory<WatchListBloc>(() => mockWatchListBloc);

  testWidgets('Should not show progress indicator when state is initial',
      (widgetTester) async {
    // arrange
    when(() => mockWatchListBloc.state).thenReturn(WatchListInitial());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: WatchScreen()));

    // assert
    expect(find.byType(WatchScreen), findsOneWidget);
    expect(find.byType(ProgressWheel), findsNothing);
  });

  testWidgets('Should show progress indicator when state is loading',
      (widgetTester) async {
    // arrange
    when(() => mockWatchListBloc.state).thenReturn(WatchListLoading());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: WatchScreen()));

    // assert
    expect(find.byType(WatchScreen), findsOneWidget);
    expect(find.byType(ProgressWheel), findsOneWidget);
  });

  testWidgets('Should show empty box when state is empty',
      (widgetTester) async {
    // arrange
    when(() => mockWatchListBloc.state).thenReturn(WatchListEmpty());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: WatchScreen()));

    // assert
    expect(find.byType(WatchScreen), findsOneWidget);
    expect(find.byType(EmptyBox), findsOneWidget);
  });

  testWidgets('Should show watch list when state is loaded',
      (widgetTester) async {
    // arrange
    when(() => mockWatchListBloc.state).thenReturn(WatchListLoaded(testMovies));

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: WatchScreen()));

    // assert
    expect(find.byType(WatchScreen), findsOneWidget);
    expect(find.byType(WatchListContainer), findsOneWidget);
  });

  testWidgets('Should show error box when state is failure',
      (widgetTester) async {
    // arrange
    when(() => mockWatchListBloc.state)
        .thenReturn(const WatchListFailure('error'));

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: WatchScreen()));

    // assert
    expect(find.byType(WatchScreen), findsOneWidget);
    expect(find.byType(ErrorBox), findsOneWidget);
  });
}

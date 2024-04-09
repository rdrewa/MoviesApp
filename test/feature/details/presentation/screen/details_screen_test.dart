import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/presentation/widget/error_box.dart';
import 'package:movies_app/feature/common/presentation/widget/headline_text.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';
import 'package:movies_app/feature/common/presentation/widget/skyscraper/skyscraper_list.dart';
import 'package:movies_app/feature/details/presentation/bloc/details/details_bloc.dart';
import 'package:movies_app/feature/details/presentation/bloc/watchedit/watch_edit_bloc.dart';
import 'package:movies_app/feature/details/presentation/screen/details_screen.dart';
import 'package:movies_app/feature/details/presentation/widget/author_text.dart';
import 'package:movies_app/feature/details/presentation/widget/body_text.dart';
import 'package:movies_app/feature/details/presentation/widget/details_container.dart';
import 'package:movies_app/feature/details/presentation/widget/ranking.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';
import '../../../../util/tester_app.dart';

void main() {
  late MockDetailsBloc mockDetailsBloc;
  late MockWatchEditBloc mockWatchEditBloc;

  setUp(() async {
    mockDetailsBloc = MockDetailsBloc();
    mockWatchEditBloc = MockWatchEditBloc();
  });

  final GetIt sl = GetIt.instance;
  sl.registerFactory<DetailsBloc>(() => mockDetailsBloc);
  sl.registerFactory<WatchEditBloc>(() => mockWatchEditBloc);

  testWidgets('Should not show progress indicator when state is initial',
      (widgetTester) async {
    // arrange
    when(() => mockDetailsBloc.state).thenReturn(DetailsInitial());

    // act
    await widgetTester
        .pumpWidget(const TesterApp(tested: DetailsScreen(id: 0)));

    // assert
    expect(find.byType(DetailsScreen), findsOneWidget);
    expect(find.byType(ProgressWheel), findsNothing);
  });

  testWidgets('Should show progress indicator when state is loading',
      (widgetTester) async {
    // arrange
    when(() => mockDetailsBloc.state).thenReturn(DetailsLoading());

    // act
    await widgetTester
        .pumpWidget(const TesterApp(tested: DetailsScreen(id: 0)));

    // assert
    expect(find.byType(DetailsScreen), findsOneWidget);
    expect(find.byType(ProgressWheel), findsOneWidget);
  });

  testWidgets('Should show details when state is loaded', (widgetTester) async {
    // arrange
    when(() => mockDetailsBloc.state)
        .thenReturn(DetailsLoaded(testMovieDetails));
    when(() => mockWatchEditBloc.state)
        .thenReturn(const WatchEditState(isAdded: false));

    // act
    await widgetTester
        .pumpWidget(const TesterApp(tested: DetailsScreen(id: 0)));

    // assert
    expect(find.byType(DetailsScreen), findsOneWidget);
    expect(find.byType(DetailsContainer), findsOneWidget);
    expect(find.byType(Ranking), findsOneWidget);
    expect(find.byType(HeadlineText), findsNWidgets(2 + 3));
    expect(find.byType(BodyText), findsNWidgets(2));
    expect(find.byType(AuthorText), findsOneWidget);
    expect(find.byType(SkyscraperList), findsNWidgets(3));
  });

  testWidgets('Should show error box when state is failure',
      (widgetTester) async {
    // arrange
    when(() => mockDetailsBloc.state).thenReturn(const DetailsFailure('error'));

    // act
    await widgetTester
        .pumpWidget(const TesterApp(tested: DetailsScreen(id: 0)));

    // assert
    expect(find.byType(DetailsScreen), findsOneWidget);
    expect(find.byType(ErrorBox), findsOneWidget);
  });
}

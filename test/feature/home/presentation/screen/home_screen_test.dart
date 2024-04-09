import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/presentation/widget/empty_box.dart';
import 'package:movies_app/feature/common/presentation/widget/error_box.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';
import 'package:movies_app/feature/common/presentation/widget/skyscraper/skyscraper_list.dart';
import 'package:movies_app/feature/home/presentation/bloc/popular/popular_bloc.dart';
import 'package:movies_app/feature/home/presentation/bloc/toprated/top_rated_bloc.dart';
import 'package:movies_app/feature/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:movies_app/feature/home/presentation/screen/home_screen.dart';
import 'package:movies_app/feature/home/presentation/widget/slider/slider_list.dart';

import '../../../../util/data.dart';
import '../../../../util/mocks.dart';
import '../../../../util/tester_app.dart';

void main() {
  late MockTrendingBloc mockTrendingBloc;
  late MockPopularBloc mockPopularBloc;
  late MockTopRatedBloc mockTopRatedBloc;

  setUp(() async {
    mockTrendingBloc = MockTrendingBloc();
    mockPopularBloc = MockPopularBloc();
    mockTopRatedBloc = MockTopRatedBloc();
  });

  final GetIt sl = GetIt.instance;
  sl.registerFactory<TrendingBloc>(() => mockTrendingBloc);
  sl.registerFactory<PopularBloc>(() => mockPopularBloc);
  sl.registerFactory<TopRatedBloc>(() => mockTopRatedBloc);

  testWidgets('Should not show any progress indicator when states are initial',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state).thenReturn(TrendingInitial());
    when(() => mockPopularBloc.state).thenReturn(PopularInitial());
    when(() => mockTopRatedBloc.state).thenReturn(TopRatedInitial());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(ProgressWheel), findsNothing);
  });

  testWidgets('Should show 3 progress indicators when states are loading',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state).thenReturn(TrendingLoading());
    when(() => mockPopularBloc.state).thenReturn(PopularLoading());
    when(() => mockTopRatedBloc.state).thenReturn(TopRatedLoading());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(ProgressWheel), findsNWidgets(3));
  });

  testWidgets('Should show 3 error boxes when states are failure',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state)
        .thenReturn(const TrendingFailure('error'));
    when(() => mockPopularBloc.state).thenReturn(const PopularFailure('error'));
    when(() => mockTopRatedBloc.state)
        .thenReturn(const TopRatedFailure('error'));

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(ErrorBox), findsNWidgets(3));
  });

  testWidgets('Should show 3 empty boxes when states are empty',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state).thenReturn(TrendingEmpty());
    when(() => mockPopularBloc.state).thenReturn(PopularEmpty());
    when(() => mockTopRatedBloc.state).thenReturn(TopRatedEmpty());

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(EmptyBox), findsNWidgets(3));
  });

  testWidgets('Should show 3 list of movies when states are loading',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state).thenReturn(TrendingLoaded(testMovies));
    when(() => mockPopularBloc.state).thenReturn(PopularLoaded(testMovies));
    when(() => mockTopRatedBloc.state).thenReturn(TopRatedLoaded(testMovies));

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(SliderList), findsOneWidget);
    expect(find.byType(SkyscraperList), findsNWidgets(2));
  });

  testWidgets(
      'Should show 1 list of movies, 1 empty state & 1 accordingly to the states',
      (widgetTester) async {
    // arrange
    when(() => mockTrendingBloc.state).thenReturn(TrendingLoaded(testMovies));
    when(() => mockPopularBloc.state).thenReturn(PopularEmpty());
    when(() => mockTopRatedBloc.state).thenReturn(const TopRatedFailure('error'));

    // act
    await widgetTester.pumpWidget(const TesterApp(tested: HomeScreen()));

    // assert
    expect(find.byType(SliderList), findsOneWidget);
    expect(find.byType(EmptyBox), findsOneWidget);
    expect(find.byType(ErrorBox), findsOneWidget);
  });
}

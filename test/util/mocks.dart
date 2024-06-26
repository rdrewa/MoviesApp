import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/data/source/local/watch_service.dart';
import 'package:movies_app/feature/common/data/source/remote/movie_service.dart';
import 'package:movies_app/feature/common/domain/repository/movie_repository.dart';
import 'package:movies_app/feature/common/domain/repository/watch_repository.dart';
import 'package:movies_app/feature/details/domain/usecase/add_to_watch_usecase.dart';
import 'package:movies_app/feature/details/domain/usecase/get_details_usecase.dart';
import 'package:movies_app/feature/details/domain/usecase/is_on_watch_usecase.dart';
import 'package:movies_app/feature/details/domain/usecase/remove_from_watch_usecase.dart';
import 'package:movies_app/feature/details/presentation/bloc/details/details_bloc.dart';
import 'package:movies_app/feature/details/presentation/bloc/watchedit/watch_edit_bloc.dart';
import 'package:movies_app/feature/home/domain/usecase/get_popular_usecase.dart';
import 'package:movies_app/feature/home/domain/usecase/get_top_rated_usecase.dart';
import 'package:movies_app/feature/home/domain/usecase/get_trending_usecase.dart';
import 'package:movies_app/feature/home/presentation/bloc/popular/popular_bloc.dart';
import 'package:movies_app/feature/home/presentation/bloc/toprated/top_rated_bloc.dart';
import 'package:movies_app/feature/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:movies_app/feature/now/domain/usecase/get_now_usecase.dart';
import 'package:movies_app/feature/now/presentation/bloc/now/now_bloc.dart';
import 'package:movies_app/feature/watch/domain/usecase/get_watch_list_usecase.dart';
import 'package:movies_app/feature/watch/presentation/bloc/list/watch_list_bloc.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockHttpClientAdapter extends Mock implements HttpClientAdapter {}

class MockMovieService extends Mock implements MovieService {}

class MockGetTrendingUsecase extends Mock implements GetTrendingUsecase {}

class MockGetTopRatedUsecase extends Mock implements GetTopRatedUsecase {}

class MockGetPopularUsecase extends Mock implements GetPopularUsecase {}

class MockGetDetailsUsecase extends Mock implements GetDetailsUsecase {}

class MockWatchService extends Mock implements WatchService {}

class MockWatchRepository extends Mock implements WatchRepository {}

class MockAddToWatchUsecase extends Mock implements AddToWatchUsecase {}

class MockRemoveFromWatchUsecase extends Mock
    implements RemoveFromWatchUsecase {}

class MockIsOnWatchUsecase extends Mock implements IsOnWatchUsecase {}

class MockGetWatchListUsecase extends Mock implements GetWatchListUsecase {}

class MockGetNowUsecase extends Mock implements GetNowUsecase {}

class MockTrendingBloc extends MockBloc<TrendingEvent, TrendingState>
    implements TrendingBloc {}

class MockPopularBloc extends MockBloc<PopularEvent, PopularState>
    implements PopularBloc {}

class MockTopRatedBloc extends MockBloc<TopRatedEvent, TopRatedState>
    implements TopRatedBloc {}

class MockNowBloc extends MockBloc<NowEvent, NowState> implements NowBloc {}

class MockWatchListBloc extends MockBloc<WatchListEvent, WatchListState>
    implements WatchListBloc {}

class MockDetailsBloc extends MockBloc<DetailsEvent, DetailsState>
    implements DetailsBloc {}

class MockWatchEditBloc extends MockBloc<WatchEditEvent, WatchEditState>
    implements WatchEditBloc {}

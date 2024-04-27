import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../feature/common/domain/model/movie.dart';

import '../feature/home/presentation/bloc/popular/popular_bloc.dart';
import '../feature/home/presentation/bloc/toprated/top_rated_bloc.dart';
import '../feature/home/presentation/bloc/trending/trending_bloc.dart';
import '../feature/details/presentation/bloc/details/details_bloc.dart';
import '../feature/details/presentation/bloc/watchedit/watch_edit_bloc.dart';
import '../feature/watch/presentation/bloc/list/watch_list_bloc.dart';
import '../feature/now/presentation/bloc/now/now_bloc.dart';
import '../feature/paginated/presentation/bloc/popular/popular_paginated_bloc.dart';

import '../feature/home/domain/usecase/get_trending_usecase.dart';
import '../feature/home/domain/usecase/get_popular_usecase.dart';
import '../feature/home/domain/usecase/get_top_rated_usecase.dart';
import '../feature/details/domain/usecase/get_details_usecase.dart';
import '../feature/details/domain/usecase/add_to_watch_usecase.dart';
import '../feature/details/domain/usecase/is_on_watch_usecase.dart';
import '../feature/details/domain/usecase/remove_from_watch_usecase.dart';
import '../feature/watch/domain/usecase/get_watch_list_usecase.dart';
import '../feature/now/domain/usecase/get_now_usecase.dart';
import '../feature/paginated/domain/usecase/get_popular_paginated_usecase.dart';

import '../feature/common/domain/repository/movie_repository.dart';
import '../feature/common/domain/repository/watch_repository.dart';
import '../feature/common/data/repository/movie_rest_repository.dart';
import '../feature/common/data/repository/watch_db_repository.dart';

import '../feature/common/data/source/remote/movie_service.dart';
import '../feature/common/data/source/local/watch_service.dart';

import '../core/interceptor/token_interceptor.dart';

import 'config.dart';

final sl = GetIt.instance;

void initDependencies() {
  // Bloc
  sl.registerFactory(() => TrendingBloc(sl()));
  sl.registerFactory(() => PopularBloc(sl()));
  sl.registerFactory(() => TopRatedBloc(sl()));
  sl.registerFactory(() => DetailsBloc(sl()));
  sl.registerFactory(() => WatchEditBloc(sl(), sl(), sl()));
  sl.registerFactory(() => WatchListBloc(sl()));
  sl.registerFactory(() => NowBloc(sl()));
  sl.registerFactory(() => PopularPaginatedBloc(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetTrendingUsecase(sl()));
  sl.registerLazySingleton(() => GetPopularUsecase(sl()));
  sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
  sl.registerLazySingleton(() => GetDetailsUsecase(sl()));
  sl.registerLazySingleton(() => IsOnWatchUsecase(sl()));
  sl.registerLazySingleton(() => AddToWatchUsecase(sl()));
  sl.registerLazySingleton(() => RemoveFromWatchUsecase(sl()));
  sl.registerLazySingleton(() => GetWatchListUsecase(sl()));
  sl.registerLazySingleton(() => GetNowUsecase(sl()));
  sl.registerLazySingleton(() => GetPopularPaginatedUsecase(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRestRepository(sl()));
  sl.registerLazySingleton<WatchRepository>(() => WatchDbRepository(sl()));

  // Data Source
  sl.registerLazySingleton<MovieService>(() => MovieService(sl()));
  sl.registerLazySingleton<WatchService>(() => WatchService(Movie.table));

  // Client
  sl.registerLazySingleton<Dio>(() => Dio()
    ..options.headers['Accept'] = 'application/json'
    ..options.baseUrl = Config.apiUrl
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true))
    ..interceptors.add(TokenInterceptor()));
}

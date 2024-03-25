import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../feature/home/presentation/bloc/popular/popular_bloc.dart';
import '../feature/home/presentation/bloc/toprated/top_rated_bloc.dart';
import '../feature/home/presentation/bloc/trending/trending_bloc.dart';
import '../feature/details/presentation/bloc/details/details_bloc.dart';

import '../feature/home/domain/usecase/get_trending_usecase.dart';
import '../feature/home/domain/usecase/get_popular_usecase.dart';
import '../feature/home/domain/usecase/get_top_rated_usecase.dart';
import '../feature/details/domain/usecase/get_details_usecase.dart';

import '../feature/common/domain/repository/movie_repository.dart';
import '../feature/common/data/repository/movie_rest_repository.dart';

import '../feature/common/data/source/remote/movie_service.dart';
import '../core/interceptor/token_interceptor.dart';

import 'config.dart';


final sl = GetIt.instance;

void initDependencies() {
  // Bloc
  sl.registerFactory(() => TrendingBloc(sl()));
  sl.registerFactory(() => PopularBloc(sl()));
  sl.registerFactory(() => TopRatedBloc(sl()));
  sl.registerFactory(() => DetailsBloc(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetTrendingUsecase(sl()));
  sl.registerLazySingleton(() => GetPopularUsecase(sl()));
  sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
  sl.registerLazySingleton(() => GetDetailsUsecase(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRestRepository(sl()));

  // Data Source
  sl.registerLazySingleton<MovieService>(() => MovieService(sl()));

  // Client
  sl.registerLazySingleton<Dio>(() => Dio()
    ..options.headers['Accept'] = 'application/json'
    ..options.baseUrl = Config.apiUrl
    ..interceptors
        .add(PrettyDioLogger(requestHeader: true, requestBody: true))
    ..interceptors
        .add(TokenInterceptor())
  );
}

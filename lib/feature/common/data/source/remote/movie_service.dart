import 'package:dio/dio.dart';
import 'package:movies_app/feature/now/domain/model/movie_now.dart';
import 'package:retrofit/http.dart';

import '../../../../common/data/model/movie_response.dart';
import '../../../../details/domain/model/movie_details.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio) = _MovieService;

  @GET('trending/all/week')
  Future<MovieResponse> getTrendingList();

  @GET('movie/popular')
  Future<MovieResponse> getPopularList();

  @GET('movie/top_rated')
  Future<MovieResponse> getTopRatedList();

  @GET('movie/{id}?append_to_response=credits,reviews,similar')
  Future<MovieDetails> getMovieDetails(@Path() int id);

  @GET('movie/now_playing')
  Future<MovieResponse> getNowList();

  @GET('movie/{id}?append_to_response=images')
  Future<MovieNow> getMovieNow(@Path() int id);
}
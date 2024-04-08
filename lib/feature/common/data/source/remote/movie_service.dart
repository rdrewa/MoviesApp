import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../now/domain/model/movie_now.dart';
import '../../../../details/domain/model/movie_details.dart';
import '../../../data/model/movie_response.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('trending/all/week')
  Future<MovieResponse> getTrendingList();

  @GET('movie/popular')
  Future<MovieResponse> getPopularList();

  @GET('movie/top_rated')
  Future<MovieResponse> getTopRatedList();

  @GET('movie/{id}?append_to_response=credits,reviews,similar,recommendations')
  Future<MovieDetails> getMovieDetails(@Path() int id);

  @GET('movie/now_playing')
  Future<MovieResponse> getNowList();

  @GET('movie/{id}?append_to_response=images')
  Future<MovieNow> getMovieNow(@Path() int id);
}
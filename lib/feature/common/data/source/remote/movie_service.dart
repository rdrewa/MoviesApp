import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../common/data/model/movie_response.dart';

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
}

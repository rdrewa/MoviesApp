import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../common/data/model/response_data.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio) = _MovieService;

  @GET('trending/all/week')
  Future<ResponseData> getTrendingList();

  @GET('movie/popular')
  Future<ResponseData> getPopularList();

  @GET('movie/top_rated')
  Future<ResponseData> getTopRatedList();
}

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../common/data/model/response_data.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieService {
  factory MovieService(Dio dio) = _MovieService;

  @GET('/trending/all/week?api_key={apiKey}')
  Future<ResponseData> getTrendingList(@Path() String apiKey);

  @GET('/movie/popular?api_key={apiKey}')
  Future<ResponseData> getPopularList(@Path() String apiKey);

  @GET('/movie/top_rated?api_key={apiKey}')
  Future<ResponseData> getTopRatedList(@Path() String apiKey);
}

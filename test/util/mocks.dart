import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/feature/common/domain/repository/movie_repository.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockHttpClientAdapter extends Mock implements HttpClientAdapter {}
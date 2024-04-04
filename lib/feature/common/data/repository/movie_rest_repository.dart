import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../details/domain/model/movie_details.dart';
import '../../../now/domain/model/movie_now.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../model/movie_response.dart';
import '../source/remote/movie_service.dart';

class MovieRestRepository implements MovieRepository {
  final MovieService service;

  MovieRestRepository(this.service);

  @override
  Future<Either<Failure, List<Movie>>> getPopularList() async {
    try {
      final MovieResponse responseData = await service.getPopularList();
      return Right(responseData.results);
    } on Exception {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingList() async {
    try {
      final MovieResponse responseData = await service.getTrendingList();
      return Right(responseData.results);
    } on Exception {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedList() async {
    try {
      final MovieResponse responseData = await service.getTopRatedList();
      return Right(responseData.results);
    } on Exception {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    try {
      final MovieDetails movieDetails = await service.getMovieDetails(id);
      return Right(movieDetails);
    } on Exception {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<MovieNow>>> getNowList() async {
    try {
      final MovieResponse responseData = await service.getNowList();
      if (responseData.results.isEmpty) {
        return Right(List<MovieNow>.empty());
      }

      final list = await _getNowParallel(responseData.results.take(8).toList());
      return Right(list);
    } on Exception {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  Future<List<MovieNow>> _getNowParallel(List<Movie> movies) async {
    List<Future<MovieNow>> futures =
        movies.map((movie) => service.getMovieNow(movie.id)).toList();
    final list = await Future.wait(futures);
    return list;
  }
}

import 'package:dartz/dartz.dart';


import '../../../../core/error/failure.dart';
import '../../../details/domain/model/movie_details.dart';
import '../../../now/domain/model/movie_now.dart';
import '../../domain/model/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingList();

  Future<Either<Failure, List<Movie>>> getPopularList();

  Future<Either<Failure, List<Movie>>> getTopRatedList();

  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);

  Future<Either<Failure, List<MovieNow>>> getNowList();
}

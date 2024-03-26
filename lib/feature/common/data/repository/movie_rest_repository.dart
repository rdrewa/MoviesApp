import 'package:dartz/dartz.dart';
import 'package:movies_app/feature/details/domain/model/movie_details.dart';

import '../../../../feature/common/data/model/movie_response.dart';
import '../../../../feature/common/data/source/remote/movie_service.dart';
import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
import '../../domain/repository/movie_repository.dart';

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
}
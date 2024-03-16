import 'package:dartz/dartz.dart';

import 'package:movies_app/core/error/failure.dart';

import 'package:movies_app/feature/common/domain/model/movie.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRestRepository implements MovieRepository {
  @override
  Future<Either<Failure, List<Movie>>> getPopularList() {
    // TODO: implement getPopularList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingList() {
    // TODO: implement getTrendingList
    throw UnimplementedError();
  }
}
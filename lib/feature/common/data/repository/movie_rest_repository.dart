import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
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

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedList() {
    // TODO: implement getTrendingList
    throw UnimplementedError();
  }
}
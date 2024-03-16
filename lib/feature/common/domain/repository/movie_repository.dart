import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingList();

  Future<Either<Failure, List<Movie>>> getPopularList();
}

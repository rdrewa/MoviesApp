import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/movie.dart';

abstract class WatchRepository {
  Future<Either<Failure, List<Movie>>> getList();

  Future<Either<Failure, void>> addItem(Movie item);

  Future<Either<Failure, void>> removeItem(Movie item);

  Future<Either<Failure, bool>> isAdded(int id);
}

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/failure.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/watch_repository.dart';
import '../source/local/watch_service.dart';

class WatchDbRepository implements WatchRepository {
  final WatchService watchService;

  WatchDbRepository(this.watchService);

  @override
  Future<Either<Failure, void>> addItem(Movie item) async {
    try {
      await watchService.addItem(item);
      return const Right(null);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isAdded(int id) async {
    try {
      Movie? item = await watchService.getItem(id);
      return Right(item != null);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getList() async {
    try {
      final data = await watchService.getList();
      return Right(data);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeItem(Movie item) async {
    try {
      await watchService.removeItem(item);
      return const Right(null);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }
}

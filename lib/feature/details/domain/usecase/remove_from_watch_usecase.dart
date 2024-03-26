import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/repository/watch_repository.dart';
import '../../../common/domain/model/movie.dart';

class RemoveFromWatchUsecase {
  final WatchRepository watchRepository;

  RemoveFromWatchUsecase(this.watchRepository);

  Future<Either<Failure, void>>call(Movie item) => watchRepository.removeItem(item);
}
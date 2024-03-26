import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/repository/watch_repository.dart';
import '../../../common/domain/model/movie.dart';

class IsOnWatchUsecase {
  final WatchRepository watchRepository;

  IsOnWatchUsecase(this.watchRepository);

  Future<Either<Failure, bool>>call(Movie item) => watchRepository.isAdded(item.key);
}
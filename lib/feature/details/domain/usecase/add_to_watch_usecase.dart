import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/repository/watch_repository.dart';
import '../../../common/domain/model/movie.dart';

class AddToWatchUsecase {
  final WatchRepository watchRepository;

  AddToWatchUsecase(this.watchRepository);

  Future<Either<Failure, void>>call(Movie item) => watchRepository.addItem(item);
}
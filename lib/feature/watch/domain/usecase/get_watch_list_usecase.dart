import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
import '../../../common/domain/repository/watch_repository.dart';

class GetWatchListUsecase {
  final WatchRepository watchRepository;

  GetWatchListUsecase(this.watchRepository);

  Future<Either<Failure, List<Movie>>> call() async =>
      watchRepository.getList();
}

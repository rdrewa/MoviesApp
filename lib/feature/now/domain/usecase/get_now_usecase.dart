import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/repository/movie_repository.dart';
import '../model/movie_now.dart';

class GetNowUsecase {
  final MovieRepository movieRepository;

  GetNowUsecase(this.movieRepository);

  Future<Either<Failure, List<MovieNow>>> call() async =>
      movieRepository.getNowList();
}

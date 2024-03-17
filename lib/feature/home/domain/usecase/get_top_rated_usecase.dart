import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
import '../../../common/domain/repository/movie_repository.dart';

class GetTopRatedUsecase {
  final MovieRepository _movieRepository;

  GetTopRatedUsecase(this._movieRepository);

  Future<Either<Failure, List<Movie>>> call() async => _movieRepository.getTopRatedList();
}
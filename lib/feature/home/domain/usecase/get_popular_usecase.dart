import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
import '../../../common/domain/repository/movie_repository.dart';

class GetPopularUsecase {
  final MovieRepository _movieRepository;

  GetPopularUsecase(this._movieRepository);

  Future<Either<Failure, List<Movie>>> call() async => _movieRepository.getPopularList();
}
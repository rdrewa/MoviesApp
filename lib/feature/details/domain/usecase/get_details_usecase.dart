import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/domain/repository/movie_repository.dart';
import '../model/movie_details.dart';

class GetDetailsUsecase {
  final MovieRepository movieRepository;

  GetDetailsUsecase(this.movieRepository);

  Future<Either<Failure, MovieDetails>> call(int id) =>
      movieRepository.getMovieDetails(id);
}

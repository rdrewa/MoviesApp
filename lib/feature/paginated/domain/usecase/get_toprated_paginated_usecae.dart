import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/data/model/movie_response.dart';
import '../../../common/domain/repository/movie_repository.dart';

class GetPopularTopRatedUsecase {
  final MovieRepository repository;

  GetPopularTopRatedUsecase(this.repository);

  Future<Either<Failure, MovieResponse>> call(int page) =>
      repository.getPopularPaginated(page);
}

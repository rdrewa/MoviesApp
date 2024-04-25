import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../common/data/model/movie_response.dart';
import '../../../common/domain/repository/movie_repository.dart';

class GetPopularTrendingUsecase {
  final MovieRepository repository;

  GetPopularTrendingUsecase(this.repository);

  Future<Either<Failure, MovieResponse>> call(int page) =>
      repository.getPopularPaginated(page);
}

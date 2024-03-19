import 'package:dartz/dartz.dart';

import '../../../../feature/common/data/model/response_data.dart';
import '../../../../feature/common/data/source/remote/movie_service.dart';
import '../../../../core/error/failure.dart';
import '../../../common/domain/model/movie.dart';
import '../../domain/repository/movie_repository.dart';

class MovieRestRepository implements MovieRepository {

  final MovieService service;

  MovieRestRepository(this.service);

  @override
  Future<Either<Failure, List<Movie>>> getPopularList() async {
    try {
      final ResponseData responseData = await service.getPopularList('apiKey');
      return Right(responseData.results);
    } on Exception catch (e) {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingList() async {
    try {
      final ResponseData responseData = await service.getTrendingList('apiKey');
      return Right(responseData.results);
    } on Exception catch (e) {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedList() async {
    try {
      final ResponseData responseData = await service.getTopRatedList('apiKey');
      return Right(responseData.results);
    } on Exception catch (e) {
      return const Left(ServerFailure('Server Failure'));
    }
  }
}
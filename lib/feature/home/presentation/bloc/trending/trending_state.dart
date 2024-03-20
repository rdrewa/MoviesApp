part of 'trending_bloc.dart';

sealed class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

final class TrendingInitial extends TrendingState {}

final class TrendingEmpty extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingLoaded extends TrendingState {
  final List<Movie> data;

  const TrendingLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class TrendingFailure extends TrendingState {
  final String message;

  const TrendingFailure(this.message);
}


part of 'top_rated_bloc.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedEmpty extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedLoaded extends TopRatedState {
  final List<Movie> data;

  const TopRatedLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class TopRatedFailure extends TopRatedState {
  final String message;

  const TopRatedFailure(this.message);
}

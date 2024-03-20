part of 'popular_bloc.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {}

final class PopularEmpty extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularLoaded extends PopularState {
  final List<Movie> data;

  const PopularLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class PopularFailure extends PopularState {
  final String message;

  const PopularFailure(this.message);
}


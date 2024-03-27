part of 'watch_list_bloc.dart';

sealed class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

final class WatchListInitial extends WatchListState {}

final class WatchListEmpty extends WatchListState {}

final class WatchListLoading extends WatchListState {}

final class WatchListLoaded extends WatchListState {
  final List<Movie> data;

  const WatchListLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class WatchListFailure extends WatchListState {
  final String message;

  const WatchListFailure(this.message);
}
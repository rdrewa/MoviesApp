part of 'watch_list_bloc.dart';

sealed class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object?> get props => [];
}

class GetWatchListEvent extends WatchListEvent {}

part of 'now_bloc.dart';

sealed class NowState extends Equatable {
  const NowState();
  
  @override
  List<Object> get props => [];
}

final class NowInitial extends NowState {}

final class NowEmpty extends NowState {}

final class NowLoading extends NowState {}

final class NowLoaded extends NowState {
  final List<MovieNow> data;

  const NowLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class NowFailure extends NowState {
  final String message;

  const NowFailure(this.message);
}
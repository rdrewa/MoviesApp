part of 'trending_bloc.dart';

sealed class TrendingEvent extends Equatable {
  const TrendingEvent();

  @override
  List<Object?> get props => [];
}

class GetTrendingEvent extends TrendingEvent {}
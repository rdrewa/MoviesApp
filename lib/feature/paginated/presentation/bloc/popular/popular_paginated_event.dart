part of 'popular_paginated_bloc.dart';

sealed class PopularPaginatedEvent extends Equatable {
  const PopularPaginatedEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularPaginatedEvent extends PopularPaginatedEvent {
  final int page;

  const GetPopularPaginatedEvent(this.page);

  @override
  List<Object?> get props => [page];
}

part of 'popular_paginated_bloc.dart';

sealed class PopularPaginatedState extends Equatable {
  const PopularPaginatedState();

  @override
  List<Object> get props => [];
}

final class PopularPaginatedInitial extends PopularPaginatedState {}

final class PopularPaginatedEmpty extends PopularPaginatedState {}

final class PopularPaginatedLoading extends PopularPaginatedState {}

final class PopularPaginatedLoaded extends PopularPaginatedState {
  final List<Movie> data;
  final bool hasMore;
  final int? next;

  const PopularPaginatedLoaded(this.data, this.hasMore, this.next);

  @override
  List<Object> get props => [data, hasMore, next ?? 0];
}

final class PopularPaginatedFailure extends PopularPaginatedState {
  final String message;

  const PopularPaginatedFailure(this.message);
}

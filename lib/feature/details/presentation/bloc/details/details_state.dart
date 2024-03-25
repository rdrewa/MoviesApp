part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  final MovieDetails data;

  const DetailsLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class DetailsFailure extends DetailsState {
  final String message;

  const DetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}

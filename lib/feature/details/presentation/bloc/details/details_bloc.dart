import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/movie_details.dart';
import '../../../domain/usecase/get_details_usecase.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetDetailsUsecase _getDetailsUsecase;

  DetailsBloc(this._getDetailsUsecase) : super(DetailsInitial()) {
    on<GetDetailsEvent>(_onGetDetailsEvent);
  }

  FutureOr<void> _onGetDetailsEvent(
      GetDetailsEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoading());

    (await _getDetailsUsecase(event.id)).fold(
        (fail) => emit(const DetailsFailure('Something went wrong')),
        (data) => emit(DetailsLoaded(data)));
  }
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/get_top_rated_usecase.dart';

part 'top_rated_event.dart';

part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final GetTopRatedUsecase _getTopRatedUsecase;

  TopRatedBloc(this._getTopRatedUsecase) : super(TopRatedInitial()) {
    on<GetTopRatedEvent>(_onGetTopRatedEvent);
  }

  FutureOr<void> _onGetTopRatedEvent(
      TopRatedEvent event, Emitter<TopRatedState> emit) async {
    emit(TopRatedLoading());

    (await _getTopRatedUsecase()).fold(
        (fail) => emit(const TopRatedFailure('Something went wrong')),
        (data) => emit(data.isEmpty ? TopRatedEmpty() : TopRatedLoaded(data)));
  }
}

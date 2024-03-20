import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/get_trending_usecase.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingUsecase _getTrendingUsecase;

  TrendingBloc(this._getTrendingUsecase) : super(TrendingInitial()) {
    on<TrendingEvent>(_onGetTrendingEvent);
  }

  FutureOr<void> _onGetTrendingEvent(
      TrendingEvent event, Emitter<TrendingState> emit) async {
    emit(TrendingLoading());

    (await _getTrendingUsecase()).fold(
        (fail) => emit(const TrendingFailure('Something went wrong')),
        (data) => emit(data.isEmpty ? TrendingEmpty() : TrendingLoaded(data)));
  }
}

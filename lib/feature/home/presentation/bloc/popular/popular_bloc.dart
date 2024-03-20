import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/get_popular_usecase.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularUsecase _getPopularUsecase;

  PopularBloc(this._getPopularUsecase) : super(PopularInitial()) {
    on<PopularEvent>(_onGetPopularEvent);
  }

  FutureOr<void> _onGetPopularEvent(
      PopularEvent event, Emitter<PopularState> emit) async {
    emit(PopularLoading());

    (await _getPopularUsecase()).fold(
        (fail) => emit(const PopularFailure('Something went wrong')),
        (data) => emit(data.isEmpty ? PopularEmpty() : PopularLoaded(data)));
  }
}

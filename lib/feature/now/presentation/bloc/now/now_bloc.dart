import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/movie_now.dart';
import '../../../domain/usecase/get_now_usecase.dart';

part 'now_event.dart';
part 'now_state.dart';

class NowBloc extends Bloc<NowEvent, NowState> {
  final GetNowUsecase _getNowUsecase;

  NowBloc(this._getNowUsecase) : super(NowInitial()) {
    on<GetNowEvent>(_onGetNowEvent);
  }

  FutureOr<void> _onGetNowEvent(
      GetNowEvent event, Emitter<NowState> emit) async {
    emit(NowLoading());

    (await _getNowUsecase()).fold(
        (fail) => emit(const NowFailure('Something went wrong')),
        (data) => emit(data.isEmpty ? NowEmpty() : NowLoaded(data)));
  }
}

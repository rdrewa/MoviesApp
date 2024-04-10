import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/get_watch_list_usecase.dart';

part 'watch_list_event.dart';

part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final GetWatchListUsecase getWatchListUsecase;

  WatchListBloc(this.getWatchListUsecase) : super(WatchListInitial()) {
    on<GetWatchListEvent>(_onGetWatchListEvent);
  }

  FutureOr<void> _onGetWatchListEvent(
      GetWatchListEvent event, Emitter<WatchListState> emit) async {
    emit(WatchListLoading());

    (await getWatchListUsecase()).fold(
        (fail) => emit(WatchListFailure(fail.message)),
        (data) =>
            emit(data.isEmpty ? WatchListEmpty() : WatchListLoaded(data)));
  }
}

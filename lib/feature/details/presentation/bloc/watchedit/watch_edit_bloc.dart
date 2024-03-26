import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/model/movie.dart';
import '../../../domain/usecase/add_to_watch_usecase.dart';
import '../../../domain/usecase/is_on_watch_usecase.dart';
import '../../../domain/usecase/remove_from_watch_usecase.dart';

part 'watch_edit_event.dart';
part 'watch_edit_state.dart';

class WatchEditBloc extends Bloc<WatchEditEvent, WatchEditState> {
  final IsOnWatchUsecase isOnWatchUsecase;
  final AddToWatchUsecase addToWatchUsecase;
  final RemoveFromWatchUsecase removeFromWatchUsecase;

  WatchEditBloc(this.isOnWatchUsecase, this.addToWatchUsecase,
      this.removeFromWatchUsecase)
      : super(const WatchEditState(isAdded: false)) {
    on<IsOnListEvent>(_onIsOnListEvent);
    on<AddToListEvent>(_onAddToListEvent);
    on<RemoveFromListEvent>(_onRemoveFromListEvent);
  }

  FutureOr<void> _onIsOnListEvent(
      IsOnListEvent event, Emitter<WatchEditState> emit) async {
    (await isOnWatchUsecase(event.item))
        .fold((fail) => null, (added) => emit(state.copyWith(isAdded: added)));
  }

  Future<FutureOr<void>> _onAddToListEvent(
      AddToListEvent event, Emitter<WatchEditState> emit) async {
    (await addToWatchUsecase(event.item))
        .fold((fail) => null, (_) => emit(state.copyWith(isAdded: true)));
  }

  FutureOr<void> _onRemoveFromListEvent(
      RemoveFromListEvent event, Emitter<WatchEditState> emit) async {
    (await removeFromWatchUsecase(event.item))
        .fold((fail) => null, (_) => emit(state.copyWith(isAdded: false)));
  }
}

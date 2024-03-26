part of 'watch_edit_bloc.dart';

sealed class WatchEditEvent extends Equatable {
  final Movie item;

  const WatchEditEvent(this.item);

  @override
  List<Object?> get props =>[item];
}

class IsOnListEvent extends WatchEditEvent {
  const IsOnListEvent(super.item);
}

class AddToListEvent extends WatchEditEvent {
  const AddToListEvent(super.item);
}

class RemoveFromListEvent extends WatchEditEvent {
  const RemoveFromListEvent(super.item);
}

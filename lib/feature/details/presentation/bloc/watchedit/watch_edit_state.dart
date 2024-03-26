part of 'watch_edit_bloc.dart';

 class WatchEditState extends Equatable {
  final bool isAdded;

  const WatchEditState({required this.isAdded});

  @override
  List<Object?> get props => [isAdded];

  WatchEditState copyWith({
    bool? isAdded,
  }) {
    return WatchEditState(
      isAdded: isAdded ?? this.isAdded,
    );
  }
}



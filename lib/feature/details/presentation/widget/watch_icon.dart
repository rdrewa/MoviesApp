import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/domain/model/movie.dart';
import '../bloc/watchedit/watch_edit_bloc.dart';

class WatchIcon extends StatelessWidget {
  final Movie item;

  const WatchIcon({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WatchEditBloc>()..add(IsOnListEvent(item)),
      child: BlocBuilder<WatchEditBloc, WatchEditState>(
          builder: (context, state) => state.isAdded
              ? IconButton(
                  onPressed: () => context
                      .read<WatchEditBloc>()
                      .add(RemoveFromListEvent(item)),
                  icon: const Icon(Icons.remove_red_eye))
              : IconButton(
                  onPressed: () =>
                      context.read<WatchEditBloc>().add(AddToListEvent(item)),
                  icon: const Icon(Icons.remove_red_eye_outlined))),
    );
  }
}

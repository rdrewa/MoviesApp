import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/extension/build_context_theme_extension.dart';
import '../../../../app/di.dart';
import '../../../common/domain/model/movie.dart';
import '../bloc/watchedit/watch_edit_bloc.dart';

class WatchIcon extends StatelessWidget {
  final Movie item;

  const WatchIcon({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Color color = context.colorScheme.onBackground;
    return BlocProvider(
      create: (context) => sl<WatchEditBloc>()..add(IsOnListEvent(item)),
      child: BlocBuilder<WatchEditBloc, WatchEditState>(
          builder: (context, state) => state.isAdded
              ? IconButton(
                  onPressed: () => context
                      .read<WatchEditBloc>()
                      .add(RemoveFromListEvent(item)),
                  icon: Icon(Icons.remove_red_eye, color: color))
              : IconButton(
                  onPressed: () =>
                      context.read<WatchEditBloc>().add(AddToListEvent(item)),
                  icon: Icon(Icons.remove_red_eye_outlined, color: color))),
    );
  }
}

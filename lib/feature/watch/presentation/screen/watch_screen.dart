import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/list/watch_list_bloc.dart';
import '../widget/watch_list_container.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => sl<WatchListBloc>()..add(GetWatchListEvent()),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<WatchListBloc, WatchListState>(
              builder: (context, state) => switch (state) {
                    WatchListInitial() => const SizedBox.shrink(),
                    WatchListEmpty() =>
                      const Text('Empty Trending Movies list'),
                    WatchListLoading() => const ProgressWheel(),
                    WatchListLoaded() => WatchListContainer(list: state.data),
                    WatchListFailure() => Text(state.message),
                  })));
}

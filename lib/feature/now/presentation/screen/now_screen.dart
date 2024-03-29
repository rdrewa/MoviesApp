import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../widget/now_container.dart';
import '../bloc/now/now_bloc.dart';

class NowScreen extends StatelessWidget {
  const NowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<NowBloc>()..add(GetNowEvent()),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<NowBloc, NowState>(
            builder: (BuildContext context, NowState state) => switch (state) {
              NowInitial() => const SizedBox.shrink(),
              NowEmpty() => const Text('Empty Trending Movies list'),
              NowLoading() => const ProgressWheel(),
              NowLoaded() => NowContainer(list: state.data),
              NowFailure() => Text(state.message),
            },
          ),
        ),
      );
}

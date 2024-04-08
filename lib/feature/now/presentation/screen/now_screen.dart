import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/presentation/widget/top_bar.dart';
import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../widget/carousel_list.dart';
import '../bloc/now/now_bloc.dart';

class NowScreen extends StatelessWidget {
  const NowScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<NowBloc>()..add(GetNowEvent()),
        child: Scaffold(
          appBar: TopBar(title: 'now.title'.tr()),
          body: BlocBuilder<NowBloc, NowState>(
            builder: (BuildContext context, NowState state) => switch (state) {
              NowInitial() => const SizedBox.shrink(),
              NowEmpty() => const Text('Empty Trending Movies list'),
              NowLoading() => const ProgressWheel(),
              NowLoaded() => CarouselList(list: state.data),
              NowFailure() => Text(state.message),
            },
          ),
        ),
      );
}

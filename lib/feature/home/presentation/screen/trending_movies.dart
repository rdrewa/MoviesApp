import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/trending/trending_bloc.dart';
import '../widget/slider_list.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent()),
      child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) => switch (state) {
                TrendingInitial() => Center(
                    child: const Text('home.title').tr(),
                  ),
                TrendingEmpty() => const Text('Empty Trending Movies list'),
                TrendingLoading() => const ProgressWheel(),
                TrendingLoaded() => SliderList(title: 'Trending', list: state.data,),
                TrendingFailure() => Text(state.message),
              }),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/trending/trending_bloc.dart';
import 'movie_item.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent()),
      child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) => switch (state) {
                TrendingInitial() => Center(
                    child: const Text('home.title').tr(),
                  ),
                TrendingEmpty() => const Text('Empty Trending Movies list'),
                TrendingLoading() => const ProgressWheel(),
                TrendingLoaded() => Column(
                    children: [
                      const Text('Trending Movies: Loaded'),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              MovieItem(data: state.data[index], background: Colors.blue,))
                    ],
                  ),
                TrendingFailure() => Text(state.message),
              }),
    );
  }
}

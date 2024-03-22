import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';

import '../../presentation/bloc/trending/trending_bloc.dart';
import 'movie_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) => switch (state) {
                  TrendingInitial() => Center(
                      child: const Text('home.title').tr(),
                    ),
                  TrendingEmpty() => const Text('Empty Trending Movies list'),
                  TrendingLoading() => const ProgressWheel(),
                  TrendingLoaded() => ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          MovieItem(data: state.data[index])),
                  TrendingFailure() => Text(state.message),
                }));
  }
}

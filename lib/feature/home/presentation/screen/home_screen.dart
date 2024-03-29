import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/trending/trending_bloc.dart';
import '../bloc/popular/popular_bloc.dart';
import '../bloc/toprated/top_rated_bloc.dart';
import 'movie_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent())),
          BlocProvider(
              create: (_) => sl<PopularBloc>()..add(GetPopularEvent())),
          BlocProvider(
              create: (_) => sl<TopRatedBloc>()..add(GetTopRatedEvent()))
        ],
      child: SafeArea(
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
                  })),
    );
  }
}

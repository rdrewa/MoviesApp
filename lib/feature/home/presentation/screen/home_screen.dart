import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/trending/trending_bloc.dart';
import 'movie_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) => switch (state) {
                  TrendingInitial() => const Center(
                      child: Text('Movie BLoC App: Home'),
                    ),
                  TrendingEmpty() => const Text('Empty Trending Movies list'),
                  TrendingLoading() => const CircularProgressIndicator(),
                  TrendingLoaded() => ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          MovieItem(data: state.data[index])),
                  TrendingFailure() => Text(state.message),
                }));
  }
}

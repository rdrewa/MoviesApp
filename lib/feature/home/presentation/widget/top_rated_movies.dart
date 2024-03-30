import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/toprated/top_rated_bloc.dart';
import 'movie_item.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TopRatedBloc>()..add(GetTopRatedEvent()),
      child: BlocBuilder<TopRatedBloc, TopRatedState>(
          builder: (context, state) => switch (state) {
                TopRatedInitial() => Center(
                    child: const Text('home.title').tr(),
                  ),
                TopRatedEmpty() => const Text('Empty TopRated Movies list'),
                TopRatedLoading() => const ProgressWheel(),
                TopRatedLoaded() => Column(
                    children: [
                      const Text('TopRated Movies: Loaded'),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              MovieItem(data: state.data[index], background: Colors.green,))
                    ],
                  ),
                TopRatedFailure() => Text(state.message),
              }),
    );
  }
}

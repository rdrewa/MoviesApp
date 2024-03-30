import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/popular/popular_bloc.dart';
import 'movie_item.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PopularBloc>()..add(GetPopularEvent()),
      child: BlocBuilder<PopularBloc, PopularState>(
          builder: (context, state) => switch (state) {
                PopularInitial() => Center(
                    child: const Text('home.title').tr(),
                  ),
                PopularEmpty() => const Text('Empty Popular Movies list'),
                PopularLoading() => const ProgressWheel(),
                PopularLoaded() => Column(
                    children: [
                      const Text('Popular Movies: Loaded'),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              MovieItem(data: state.data[index], background: Colors.orange,))
                    ],
                  ),
                PopularFailure() => Text(state.message),
              }),
    );
  }
}

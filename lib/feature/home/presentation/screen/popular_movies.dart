import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/popular/popular_bloc.dart';
import '../widget/skyscraper/skyscraper_list.dart';

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
                PopularLoaded() => SkyscraperList(
                    title: 'Popular',
                    list: state.data,
                  ),
                PopularFailure() => Text(state.message),
              }),
    );
  }
}

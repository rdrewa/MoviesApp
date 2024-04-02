import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/empty_box.dart';
import '../../../common/presentation/widget/error_box.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../bloc/trending/trending_bloc.dart';
import '../widget/slider/slider_list.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent()),
      child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) => switch (state) {
                TrendingInitial() => const SizedBox.shrink(),
                TrendingEmpty() => const EmptyBox(message: 'Empty Trending Movies list'),
                TrendingLoading() => const ProgressWheel(),
                TrendingLoaded() => SliderList(title: 'Trending', list: state.data,),
                TrendingFailure() => ErrorBox(message: state.message),
              }),
    );
  }
}

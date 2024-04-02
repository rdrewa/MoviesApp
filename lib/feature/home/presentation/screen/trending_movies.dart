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
    final double height = MediaQuery.of(context).size.height * 0.35;
    return BlocProvider(
      create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent()),
      child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) => switch (state) {
                TrendingInitial() => const SizedBox.shrink(),
                TrendingEmpty() =>
                  EmptyBox(message: 'home.trending.empty'.tr()),
                TrendingLoading() => ProgressWheel(height: height),
                TrendingLoaded() => SliderList(
                    title: 'home.trending.title'.tr(),
                    list: state.data,
                    height: height,
                  ),
                TrendingFailure() => ErrorBox(message: state.message),
              }),
    );
  }
}

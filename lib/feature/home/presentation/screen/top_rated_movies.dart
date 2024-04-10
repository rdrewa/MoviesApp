import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di.dart';
import '../../../common/presentation/widget/empty_box.dart';
import '../../../common/presentation/widget/error_box.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../common/presentation/widget/skyscraper/skyscraper_list.dart';
import '../bloc/toprated/top_rated_bloc.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TopRatedBloc>()..add(GetTopRatedEvent()),
      child: BlocBuilder<TopRatedBloc, TopRatedState>(
          builder: (context, state) => switch (state) {
                TopRatedInitial() => const SizedBox.shrink(),
                TopRatedEmpty() =>
                  EmptyBox(message: 'home.toprated.empty'.tr()),
                TopRatedLoading() => const ProgressWheel(
                    height: 250,
                  ),
                TopRatedLoaded() => SkyscraperList(
                    title: 'home.toprated.title'.tr(),
                    list: state.data,
                  ),
                TopRatedFailure() => ErrorBox(message: state.message),
              }),
    );
  }
}

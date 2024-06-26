import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_routes.dart';
import '../../../../app/di.dart';
import '../../../common/presentation/widget/empty_box.dart';
import '../../../common/presentation/widget/error_box.dart';
import '../../../common/presentation/widget/progress_wheel.dart';
import '../../../common/presentation/widget/skyscraper/skyscraper_list.dart';
import '../bloc/popular/popular_bloc.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PopularBloc>()..add(GetPopularEvent()),
      child: BlocBuilder<PopularBloc, PopularState>(
          builder: (context, state) => switch (state) {
                PopularInitial() => const SizedBox.shrink(),
                PopularEmpty() => EmptyBox(message: 'home.popular.empty'.tr()),
                PopularLoading() => const ProgressWheel(height: 250),
                PopularLoaded() => SkyscraperList(
                    title: 'home.popular.title'.tr(),
                    list: state.data,
                    route: AppRoutes.popular,
                  ),
                PopularFailure() => ErrorBox(message: state.message),
              }),
    );
  }
}
